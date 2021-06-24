using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Register : MonoBehaviour
{
    public InputField UserNameInput;
    public InputField PasswordInput;
    public Button RegisterButton;

    void Start()
    {
        RegisterButton.onClick.AddListener(() => {
            StartCoroutine(Main.Instance.Web.RegisterUser(UserNameInput.text, PasswordInput.text));
        });
    }
}
