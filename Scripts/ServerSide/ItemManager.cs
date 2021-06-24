using System.Net.Mime;
using System.Runtime.Versioning;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using SimpleJSON;
using Vector3 = UnityEngine.Vector3;


public class ItemManager : MonoBehaviour
{
    Action<string> _createItemsCallback;
    // Start is called before the first frame update
    void Start()
    {
        _createItemsCallback = (jsonArrayString) => {
            StartCoroutine(CreateItemsRoutine(jsonArrayString));
        };


        CreateItems();
    }

    public void CreateItems() {
        string userId = Main.Instance.UserInfo.UserID;
        StartCoroutine(Main.Instance.Web.GetItemsIDs(userId, _createItemsCallback));
    }
    IEnumerator CreateItemsRoutine(string jsonArrayString){
        //parsing json array string as an array
        JSONArray jsonArray = JSON.Parse(jsonArrayString) as JSONArray;
        
        for (int i = 0; i < jsonArray.Count; i++)
        {
            //Yerel değişkenler yarat
            bool isDone = false; //İndiriliyor mu?
            string itemId =  jsonArray[i].AsObject["itemID"];
            string id =  jsonArray[i].AsObject["ID"];

            JSONObject itemInfoJson = new JSONObject();

            //Web.cs den veri almak için callback oluştur
            Action<string> getItemInfoCallback = (itemInfo) => {
                isDone = true;
                JSONArray tempArray = JSON.Parse(itemInfo) as JSONArray;
                itemInfoJson = tempArray[0].AsObject;
                };

                //Wait unti Web.cs calls the callback we passed as a parameter
                StartCoroutine(Main.Instance.Web.GetItem(itemId, getItemInfoCallback));

                //Callback Web ten çağrılana kadar bekle (veri indirmeyi tamamladı)
                yield return new WaitUntil(() => isDone == true);

                //Instantiate GameObject (item prefab)
                GameObject itemGo = Instantiate(Resources.Load("Prefabs/Item") as GameObject);
                Item item = itemGo.AddComponent<Item>();
                
                item.ID = id;
                item.ItemID = itemId;

                itemGo.transform.SetParent(this.transform);
                itemGo.transform.localScale = Vector3.one;
                itemGo.transform.localPosition = Vector3.zero;

                //Eşya bilgilerini doldur
                itemGo.transform.Find("Name").GetComponent<Text>().text = itemInfoJson["name"];
                itemGo.transform.Find("Price").GetComponent<Text>().text = itemInfoJson["price"];
                itemGo.transform.Find("Description").GetComponent<Text>().text = itemInfoJson["description"];

                //Eşya satma
                itemGo.transform.Find("SellButton").GetComponent<Button>().onClick.AddListener(() =>{
                    string idInInventory = id;
                    string iId = itemId;
                    string userId = Main.Instance.UserInfo.UserID;
                    StartCoroutine(Main.Instance.Web.SellItem(idInInventory,itemId, userId));
                });

                //Sonraki eşyaya geç
        }
    }
}
