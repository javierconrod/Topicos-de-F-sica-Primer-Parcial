using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Movimiento : MonoBehaviour
{
    Rigidbody rb;
    public float speed = 2.0f;

    public float movementSpeed = 5.0f;
    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
        rb.freezeRotation=true;
    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(0, 0, Input.GetAxis("Vertical") * Time.deltaTime * movementSpeed);

        if(Input.GetKeyDown(KeyCode.LeftArrow))
        {
            rb.velocity = -transform.right * speed;
        }
        if(Input.GetKeyDown(KeyCode.RightArrow))
        {
            rb.velocity = transform.right * speed;
        }
        if(Input.GetKeyDown(KeyCode.UpArrow))
        {
             rb.velocity = new Vector3(0, 0, 1) * speed;
        }
        if(Input.GetKeyDown(KeyCode.DownArrow))
        {
             rb.velocity = new Vector3(0, 0, -1) * speed;
        }
        
    }
}
