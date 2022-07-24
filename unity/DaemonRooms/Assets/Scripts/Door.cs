using UnityEngine;
// Дверь должна иметь тег Door
// Дверь должна быть дочерним объектом

public class Door : MonoBehaviour
{
    public enum open_type_ENUM { rot_to_open, move_to_open } // обычная - выдвижная
    public open_type_ENUM open_type;

    public enum door_axis_ENUM { X, Y, Z }
    public door_axis_ENUM door_axis;

    public bool only_open; // можно только открыть
    public bool can_be_opened_now;
    private bool is_open = false;
    public float open_speed = 150f;
    public float open_dist_or_angle = 140f;

    public AudioSource move_or_not_sound;
    public AudioSource open_sound;
    public AudioSource close_sound;
    public AudioSource not_opening_sound;

    public GameObject door_handle; // ручка
    public enum handle_axis_ENUM { X, Y, Z } // ось вращения ручки
    public handle_axis_ENUM handle_axis;
    public float handle_rot_angle = -45f;

    private Quaternion handle_start_rot;
    private float start_dist_or_angle;
    private bool open_close_ON;

    public GameObject interaction_image; // иконка при наведении на дверь

    void Start()
    {
        Debug.Log("STARTED " + transform.localEulerAngles.y);
        if (open_type == open_type_ENUM.move_to_open)
        {
            switch (door_axis)
            {
                case door_axis_ENUM.X:
                    start_dist_or_angle = transform.localPosition.x;
                    break;
                case door_axis_ENUM.Y:
                    start_dist_or_angle = transform.localPosition.y;
                    break;
                case door_axis_ENUM.Z:
                    start_dist_or_angle = transform.localPosition.z;
                    break;
            }
        }
        else
        {
            switch (door_axis)
            {
                case door_axis_ENUM.X:
                    start_dist_or_angle = transform.localEulerAngles.x;
                    break;
                case door_axis_ENUM.Y:
                    start_dist_or_angle = transform.localEulerAngles.y;
                    break;
                case door_axis_ENUM.Z:
                    start_dist_or_angle = transform.localEulerAngles.z;
                    break;
            }
        }

        if (door_handle)
            handle_start_rot = door_handle.transform.localRotation;
    }

    void OnMouseEnter()
    {
        if (gameObject.tag == "Door" && interaction_image)
            interaction_image.SetActive(true);
    }

    void OnMouseExit()
    {
        if (gameObject.tag == "Door" && interaction_image)
            interaction_image.SetActive(false);
    }

    void onStartDoorIfNeeded()
    {
        if (gameObject.tag == "Door")
        {
            if (door_handle)
            {
                switch (handle_axis)
                {
                    case handle_axis_ENUM.X:
                        door_handle.transform.localRotation = Quaternion.Euler(handle_rot_angle, 0f, 0f);
                        break;
                    case handle_axis_ENUM.Y:
                        door_handle.transform.localRotation = Quaternion.Euler(0f, handle_rot_angle, 0f);
                        break;
                    case handle_axis_ENUM.Z:
                        door_handle.transform.localRotation = Quaternion.Euler(0f, 0f, handle_rot_angle);
                        break;
                }
            }

            open_close();
        }
    }

    void Update()
    {
        if (Input.touchCount > 0 && Input.touches[0].phase == TouchPhase.Began)
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.touches[0].position);
            RaycastHit hit;
            print(ray);
            if (Physics.Raycast(ray, out hit))
            {
                print("START OPENING");
                onStartDoorIfNeeded();
            }
        }

        Open();
    }

    void Open()
    {
        if (open_close_ON)
        {
            if (is_open) // Открытие
            {
                print("OPEN EFFECT open_close_ON: " + open_close_ON + "- is_open: " + is_open + "- Tag " + gameObject.tag);
                if (open_type == open_type_ENUM.move_to_open)
                {
                    switch (door_axis)
                    {
                        case door_axis_ENUM.X:
                            float posX = Mathf.MoveTowards(transform.localPosition.x, start_dist_or_angle + open_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localPosition = new Vector3(posX, transform.localPosition.y, transform.localPosition.z);
                            if (transform.localPosition.x - (start_dist_or_angle + open_dist_or_angle) < 0.1) stop_open_close();
                            break;
                        case door_axis_ENUM.Y:
                            float posY = Mathf.MoveTowards(transform.localPosition.y, start_dist_or_angle + open_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localPosition = new Vector3(transform.localPosition.x, posY, transform.localPosition.z);
                            if (transform.localPosition.y - (start_dist_or_angle + open_dist_or_angle) < 0.1) stop_open_close();
                            break;
                        case door_axis_ENUM.Z:
                            float posZ = Mathf.MoveTowards(transform.localPosition.z, start_dist_or_angle + open_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, posZ);
                            if (transform.localPosition.z - (start_dist_or_angle + open_dist_or_angle) < 0.1) stop_open_close();
                            break;
                    }
                }
                else
                {
                    switch (door_axis)
                    {
                        case door_axis_ENUM.X:
                            float angelX = Mathf.MoveTowardsAngle(transform.localEulerAngles.x, start_dist_or_angle + open_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localEulerAngles = new Vector3(angelX, 0, 0);
                            if (transform.localEulerAngles.x - (start_dist_or_angle + open_dist_or_angle) < 0.1) stop_open_close();
                            break;
                        case door_axis_ENUM.Y:
                            float angelY = Mathf.MoveTowardsAngle(transform.localEulerAngles.y, start_dist_or_angle + open_dist_or_angle, open_speed * Time.deltaTime);
                            print("ANgle" + angelY);
                            transform.localEulerAngles = new Vector3(0, angelY, 0);
                            print("Need to stop: " + transform.localEulerAngles.y + " " + (start_dist_or_angle + open_dist_or_angle) + " " + (transform.localEulerAngles.y == start_dist_or_angle + open_dist_or_angle));
                            if (transform.localEulerAngles.y - (start_dist_or_angle + open_dist_or_angle) < 0.1) stop_open_close();
                            break;
                        case door_axis_ENUM.Z:
                            float angelZ = Mathf.MoveTowardsAngle(transform.localEulerAngles.z, start_dist_or_angle + open_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localEulerAngles = new Vector3(0, 0, angelZ);
                            if (transform.localEulerAngles.z - (start_dist_or_angle + open_dist_or_angle) < 0.1) stop_open_close();
                            break;
                    }
                }
            }
            else
            {
                if (open_type == open_type_ENUM.move_to_open)
                {
                    switch (door_axis)
                    {
                        case door_axis_ENUM.X:
                            float posX = Mathf.MoveTowards(transform.localPosition.x, start_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localPosition = new Vector3(posX, transform.localPosition.y, transform.localPosition.z);
                            if (transform.localPosition.x == start_dist_or_angle) stop_open_close();
                            break;
                        case door_axis_ENUM.Y:
                            float posY = Mathf.MoveTowards(transform.localPosition.y, start_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localPosition = new Vector3(transform.localPosition.x, posY, transform.localPosition.z);
                            if (transform.localPosition.y == start_dist_or_angle) stop_open_close();
                            break;
                        case door_axis_ENUM.Z:
                            float posZ = Mathf.MoveTowards(transform.localPosition.z, start_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, posZ);
                            if (transform.localPosition.z == start_dist_or_angle) stop_open_close();
                            break;
                    }
                }
                else
                {
                    switch (door_axis)
                    {
                        case door_axis_ENUM.X:
                            float angelX = Mathf.MoveTowardsAngle(transform.localEulerAngles.x, start_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localEulerAngles = new Vector3(angelX, 0, 0);
                            if (transform.localEulerAngles.x == start_dist_or_angle) stop_open_close();
                            break;
                        case door_axis_ENUM.Y:
                            float angelY = Mathf.MoveTowardsAngle(transform.localEulerAngles.y, start_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localEulerAngles = new Vector3(0, angelY, 0);
                            if (transform.localEulerAngles.y == start_dist_or_angle) stop_open_close();
                            break;
                        case door_axis_ENUM.Z:
                            float angelZ = Mathf.MoveTowardsAngle(transform.localEulerAngles.z, start_dist_or_angle, open_speed * Time.deltaTime);
                            transform.localEulerAngles = new Vector3(0, 0, angelZ);
                            if (transform.localEulerAngles.z == start_dist_or_angle) stop_open_close();
                            break;
                    }
                }
            }
        }
    }

    void open_close()
    {
        if (can_be_opened_now)
        {
            if (move_or_not_sound) move_or_not_sound.Play();
            open_close_ON = true;
            if (is_open) is_open = false;
            else
            {
                is_open = true;
                if (open_sound) open_sound.Play();
                if (only_open)
                {
                    gameObject.tag = "Untagged";
                    if (interaction_image) interaction_image.SetActive(false);
                }
            }
        }
        else
        {
            if (not_opening_sound) not_opening_sound.Play();
            print("Door is closed");
        }
    }

    void stop_open_close()
    {
        open_close_ON = false;
        if (move_or_not_sound) move_or_not_sound.Stop();
        if (close_sound && !is_open) close_sound.Play();
    }

}