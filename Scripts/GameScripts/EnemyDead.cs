using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyDead : MonoBehaviour
{
    void Update()
    {
        void OnTriggerEnter2D(Collider2D collision)
        {
            if (collision.tag == "Fireball")
            {
                Debug.Log("vurdun");
            }
        }
    }
}
