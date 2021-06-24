using UnityEngine;
using UnityEngine.SceneManagement;

public class PauseMenu : MonoBehaviour
{
    public static bool GameIsPaused = false;
    public GameObject pauseMenuUI;
    public GameObject HealthUI;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            if(GameIsPaused)
            {
                Resume();
            }
            else{
                Pause();
            }
        }
    }

    public void Resume(){
            pauseMenuUI.SetActive(false);
            HealthUI.SetActive(true);
            Time.timeScale = 1f;
            GameIsPaused = false;
        }
    void Pause(){
            pauseMenuUI.SetActive(true);
            HealthUI.SetActive(false);
            Time.timeScale = 0f;
            GameIsPaused = true;
        }

    public void RestartGame() {
             SceneManager.LoadScene(SceneManager.GetActiveScene().name); // mevcut sahneyi yükler
             Time.timeScale = 1f;
         }

    public void QuitGame(){
        Debug.Log("Çıkış yapıldı");
        Application.Quit();
    }
}
