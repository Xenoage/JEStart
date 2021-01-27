#include <windows.h>
#include <stdio.h>
#include <string>

//#define DEBUG_MODE

#define STR_LEN_1 100
#define STR_LEN_2 200

//char buffer
char buffer[10001] =  "%XNG_JESTART_BUFFER%                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 321";

//buffer contents
//each entry must end with a '\0' character!

#define POS_JAR_NAME 0 
#define LEN_JAR_NAME 100

#define POS_JAVA_EXE POS_JAR_NAME + LEN_JAR_NAME
#define LEN_JAVA_EXE 1000

#define POS_JRE_REQUIRED POS_JAVA_EXE + LEN_JAVA_EXE
#define LEN_JRE_REQUIRED 100

#define POS_OPTIONS POS_JRE_REQUIRED + LEN_JRE_REQUIRED
#define LEN_OPTIONS 3000

#define POS_ARGUMENTS POS_OPTIONS + LEN_OPTIONS
#define LEN_ARGUMENTS 2000

#define POS_ERR_JRE_NOT_FOUND POS_ARGUMENTS + LEN_ARGUMENTS
#define LEN_ERR_JRE_NOT_FOUND 500

#define POS_ERR_JRE_WRONG_VERSION POS_ERR_JRE_NOT_FOUND + LEN_ERR_JRE_NOT_FOUND
#define LEN_ERR_JRE_WRONG_VERSION 500

#define POS_ERR_JRE_ERROR POS_ERR_JRE_WRONG_VERSION + LEN_ERR_JRE_WRONG_VERSION
#define LEN_ERR_JRE_ERROR 500

#define POS_ERR_JAR_PACKED_ERROR POS_ERR_JRE_ERROR + LEN_ERR_JRE_ERROR
#define LEN_ERR_JAR_PACKED_ERROR 500

#define POS_ERR_JAR_NOT_FOUND POS_ERR_JAR_PACKED_ERROR + LEN_ERR_JAR_PACKED_ERROR
#define LEN_ERR_JAR_NOT_FOUND 500

#define POS_JAR_PACKED_NAME POS_ERR_JAR_NOT_FOUND + LEN_ERR_JAR_NOT_FOUND
#define LEN_JAR_PACKED_NAME 100

//flags
#define POS_FLAGS 9900
#define FLAG_START_WITHOUT_REGISTRY 0
#define FLAG_START_DESPITE_REGISTRY_ERROR 1
#define FLAG_JRE_REQUIRED_OR_HIGHER 2
#define FLAG_JAR_PACKED 3
#define FLAG_JAR_DELETE_AT_END 4

//errors
#define ERR_REGISTRY_JRE_NOT_FOUND     100
#define ERR_REGISTRY_JRE_WRONG_VERSION 101
#define ERR_REGISTRY_JRE_ERROR         102
#define ERR_JAR_PACKED_ERROR           103


using namespace std;



void GetProgramDir(char* szProgramPath)
{
  GetModuleFileName(NULL, (LPSTR)szProgramPath, MAX_PATH);
  strcpy(strrchr((const char *)szProgramPath, '\\')+1, "");
  //MessageBox(0, szProgramPath, 0, 0);
  return;
}

void Replace(string& source, const string& find, const string& replace)
{ 
  size_t j;
  for (;(j = source.find(find)) != string::npos;)
  {
    source.replace(j, find.length(), replace);
  }
}

inline void TrimR(string& source, const string& t = " ")
{ 
  source.erase(source.find_last_not_of(t) + 1);
}

bool StartsWith(char s[], char find[])
{
  bool thesame = true;
  if (strlen(find) > strlen(s))
  {
    thesame = false;
  }
  else
  { 
    int i = 0;
    while ((find[i] != '\0') && thesame)
    {
      thesame = (find[i] == s[i]);
      i++;
    }
  }
  return thesame;
}


//Returns true, if the second version (v2) is
//higher than the first one (v1).
bool IsVersionHigher(char v1[], char v2[])
{
  return (strcmp(v1, v2) < 0);
}

//Write into log file, if open
void Log(FILE *fLog, string text)
{
  if (fLog != NULL)
  {
    text += "\n";
    fprintf(fLog, text.c_str());
  }
}


//Close log file, if open
void LogClose(FILE *fLog)
{
  if (fLog != NULL)
  {
    fclose(fLog);
  }
}


int main(int argc, char *argv[])
{
  
  int err = 0;
  char szProgramPath[MAX_PATH + 1];
  GetProgramDir(szProgramPath);
  //MessageBox(0, szProgramPath, 0, 0);

  #ifdef DEBUG_MODE
    //Test
    strcpy(&buffer[POS_JAR_NAME], "myjar.jar");
    strcpy(&buffer[POS_OPTIONS], "-o nix");
    strcpy(&buffer[POS_ARGUMENTS], "-a nix");
    strcpy(&buffer[POS_JAVA_EXE], "java.exe");
    strcpy(&buffer[POS_JRE_REQUIRED], "1.4");
    strcpy(&buffer[POS_ERR_JRE_NOT_FOUND], "No Java Runtime Environment was detected on your system!");
    strcpy(&buffer[POS_ERR_JRE_WRONG_VERSION], "Sorry, no suitable JRE version found on your system!");
    strcpy(&buffer[POS_ERR_JRE_ERROR], "Something is wrong with your JRE configuration! Reinstall Java!");
    strcpy(&buffer[POS_ERR_JAR_PACKED_ERROR], "Temporary Jar could not be extracted! Exe file is corrupt!");
    strcpy(&buffer[POS_JAR_PACKED_NAME], "myjar.tmp");
    
    buffer[POS_FLAGS + FLAG_JRE_REQUIRED_OR_HIGHER] = '1';
    buffer[POS_FLAGS + FLAG_START_DESPITE_REGISTRY_ERROR] = '1';
    buffer[POS_FLAGS + FLAG_START_WITHOUT_REGISTRY] = '0';
    buffer[POS_FLAGS + FLAG_JAR_PACKED] = '0';
    buffer[POS_FLAGS + FLAG_JAR_DELETE_AT_END] = '1';
  #endif
  
  //if file jestartlog.txt exists, use it for logging the start process
  //(will be overwritten)
  //version 2.1 fix: logfile: use absolute path
  //otherwise the logfile would not be found if not called
  //directly from the exe's folder
  char logfilepath[MAX_PATH + 1];
  GetProgramDir(logfilepath);
  strcat(logfilepath, "jestartlog.txt");
  bool bLog = false;
  FILE *fLog = fopen(logfilepath, "r");
  if (fLog != NULL)
  {
    fclose(fLog);
    fLog = fopen("jestartlog.txt", "w");
    Log(fLog, "Logging started.");
    if (fLog != NULL) bLog = true;
  }
  
  char current_jre[STR_LEN_1] = ""; DWORD current_jre_size = STR_LEN_1;
  char use_jre[STR_LEN_1] = ""; DWORD use_jre_size = STR_LEN_1;
  char use_jre_path[STR_LEN_2] = ""; DWORD use_jre_path_size = STR_LEN_2;
  
  //Just start the default Java executable or search in the registry?
  if (buffer[POS_FLAGS + FLAG_START_WITHOUT_REGISTRY] != '1')
  {
    //Search in registry for installed JREs and find a suitable one
    Log(fLog, "Search for JRE in Registry...");
    HKEY regkey = 0;
    if (RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\\JavaSoft\\Java Runtime Environment\\", 
      0, KEY_READ, &regkey) == ERROR_SUCCESS)
    {
      //Read current JRE version
      if (RegQueryValueEx(regkey, "CurrentVersion", 0, 0,
        (BYTE*) current_jre, &current_jre_size) != ERROR_SUCCESS)
      {
        Log(fLog, "Could not read current version!");
      }
        else
      {
        Log(fLog, (string) "Current JRE version: " + (string) current_jre);
      }
      int i = 0, ret;
      char vers[STR_LEN_1]; DWORD vers_size = STR_LEN_1;
      do
      {
        vers_size = STR_LEN_1;
        ret = RegEnumKeyEx(regkey, i, vers, &vers_size, 0, 0, 0, 0);
        if (ret == ERROR_SUCCESS)
        {
          Log(fLog, (string) "JRE found: " + (string) vers);
          //Is this a allowed version? It is allowed, if it starts with
          //the "required jre string" or if the higher-flag is set and
          //vers is a newer version than the required jre.
          bool allowed = false; 
          if (StartsWith(vers, &buffer[POS_JRE_REQUIRED]) ||
            ((buffer[POS_FLAGS + FLAG_JRE_REQUIRED_OR_HIGHER] == '1') &&
            IsVersionHigher(&buffer[POS_JRE_REQUIRED], vers)))
          {
            //We can use it! (Overwrite old setting, if this
            //version is newer than the last one)
            if ((strlen(use_jre) == 0) || IsVersionHigher(use_jre, vers))
            {
              strcpy(use_jre, vers);
              //Read the path of the JRE
              HKEY pathkey;
              if (RegOpenKeyEx(regkey, use_jre, 
                0, KEY_READ, &pathkey) == ERROR_SUCCESS)
              {
                use_jre_path_size = STR_LEN_2;
                if (RegQueryValueEx(pathkey, "JavaHome", 0, 0,
                  (BYTE*) use_jre_path, &use_jre_path_size) != ERROR_SUCCESS)
                {
                  //Error!
                  //MessageBox(0, err_jreerror, 0, MB_ICONERROR);
                  //return 0;
                  err = ERR_REGISTRY_JRE_ERROR;
                  ret = ERROR_SUCCESS - 1; //break the loop
                }
                RegCloseKey(pathkey);
              }
              else
              {
                //Error!
                //MessageBox(0, err_jreerror, 0, MB_ICONERROR);
                //return 0;
                err = ERR_REGISTRY_JRE_ERROR;
                ret = ERROR_SUCCESS - 1; //break the loop
              }
            }
            //Is this also the "current version" on this system? If
            //yes, use it and do not overwrite this setting any more.
            if (strcmp(use_jre, current_jre) == 0)
            {
              ret = ERROR_SUCCESS - 1; //break the loop
            }
          }
        }
        i++;
      } while (ret == ERROR_SUCCESS);
      RegCloseKey(regkey);
      //if use_jre is empty, we found no suitable JRE
      if (strlen(use_jre) == 0)
      {
        err = ERR_REGISTRY_JRE_WRONG_VERSION;
      }
    }
    else
    {
      //Error!
      //MessageBox(0, err_nojrefound, 0, MB_ICONERROR);
      //return 0;
      err = ERR_REGISTRY_JRE_NOT_FOUND;
    }
  }
  
  
  //See if we found a JRE
  if ((err == 0) && (strlen(use_jre) > 0))
  {
    //We found one
    Log(fLog, (string) "JRE selected: " + (string) use_jre);
    Log(fLog, (string) "JRE path selected: " + (string) use_jre_path);
    //MessageBox(0, use_jre, 0, MB_ICONINFORMATION);
    //MessageBox(0, use_jre_path, 0, MB_ICONINFORMATION);
  }
  else if (err != 0)
  {
    //An error occured!
    //Show an error message and exit or proceed without a message and try
    //to start anyway if FLAG_START_DESPITE_REGISTRY_ERROR is set
    if ((buffer[POS_FLAGS + FLAG_START_DESPITE_REGISTRY_ERROR] == '1') &&
      (err != ERR_REGISTRY_JRE_WRONG_VERSION))
    {
      Log(fLog, "Error: Registry error, but trying to start anyway...");
      strcpy(use_jre_path, "");
    }
    else
    {
      if (err == ERR_REGISTRY_JRE_NOT_FOUND)
      {
        //No JRE could be found in the registry
        Log(fLog, (string) "Error: " + (string) &buffer[POS_ERR_JRE_NOT_FOUND]);
        MessageBox(0, &buffer[POS_ERR_JRE_NOT_FOUND], 0, MB_ICONERROR);
      }
      else if (err == ERR_REGISTRY_JRE_WRONG_VERSION)
      {
        //No suitable JRE could be found in the registry
        Log(fLog, (string) "Error: " + (string) &buffer[POS_ERR_JRE_WRONG_VERSION]);
        MessageBox(0, &buffer[POS_ERR_JRE_WRONG_VERSION], 0, MB_ICONERROR);
      }
      else if (err == ERR_REGISTRY_JRE_ERROR)
      {
        //Something is wrong with the JRE configuration in the registry
        Log(fLog, (string) "Error: " + (string) &buffer[POS_ERR_JRE_ERROR]);
        MessageBox(0, &buffer[POS_ERR_JRE_ERROR], 0, MB_ICONERROR);
      }
      LogClose(fLog);
      return 0;
    }
  }
           
  //java executable path
  string javaexe = &buffer[POS_JAVA_EXE];
  if (strlen(use_jre_path) > 0)
  {
    javaexe.insert(0, string(use_jre_path) + string("\\bin\\"));
  }
  Log(fLog, (string) "Java executable path: " + javaexe);
  
  //if jar is packed in the exe, extract it now
  bool jarpacked = (buffer[POS_FLAGS + FLAG_JAR_PACKED] == '1');
  if (jarpacked)
  {
    int err = ERR_JAR_PACKED_ERROR; //change this only if everything worked fine
    //open this exe file and search for the start sign
    //"%XNG_JESTART_JAR_PACKED%"
    FILE *fexe;
    char exepath[MAX_PATH + 1];
    GetModuleFileName(NULL, (LPSTR)exepath, MAX_PATH);
    fexe = fopen(exepath, "rb");
    if (fexe != NULL)
    {
      //get file size
      fseek (fexe, 0, SEEK_END);
      long fexelen = ftell(fexe);
      rewind (fexe);
      //char ttt[100];
      //sprintf(ttt, "%i", fexelen);
      //MessageBox(0, ttt, 0, 0);
      // allocate memory to contain the whole file
      char *fexebuffer = (char*) malloc (fexelen);
      if (fexebuffer != NULL)
      {
        //copy the file into the buffer
        fread(fexebuffer, 1, fexelen, fexe);
        //search for the start sign
        int i = 0;
        char startsign[25] = "_XNG_JESTART_JAR_PACKED_";
        startsign[0] = '%';
        startsign[23] = '%';
        int startsignlen = strlen(startsign);
        int startsignpos = -1;
        while ((i < fexelen - startsignlen) && (startsignpos == -1))
        {
          if (fexebuffer[i] == '%')
          {
            if (strncmp(&fexebuffer[i], startsign, startsignlen) == 0)
            {
              startsignpos = i;
            }
          }
          i++;
        } /*
        char ttt[100];
        sprintf(ttt, "%i", i);
        MessageBox(0, ttt, 0, 0); */
        if (startsignpos > -1)
        {
          startsignpos = startsignpos + startsignlen;
          //create temp jar file
          char ftemppath[MAX_PATH + 1];
          GetProgramDir(ftemppath);
          strcat(ftemppath, &buffer[POS_JAR_PACKED_NAME]);
          FILE *ftemp = fopen(ftemppath, "wb");
          if (ftemp != NULL)
          {
            fwrite(&fexebuffer[startsignpos], 1, fexelen - startsignpos, ftemp);
               //char ttt[100];
               //sprintf(ttt, "%i", fexelen - startsignpos);
               //MessageBox(0, ttt, 0, 0);
            //everything went ok
            err = 0;
            //terminate ftemp
            fclose(ftemp);
          }
          Log(fLog, (string) "Temp Jar extracted to: " + (string) ftemppath);
        }
        //terminate fexe
        fclose(fexe);
        free(fexebuffer);
      }
    }
    if (err != 0)
    {
      //An error occured!
      Log(fLog, (string) "Error: " + (string) &buffer[POS_ERR_JAR_PACKED_ERROR]);
      MessageBox(0, &buffer[POS_ERR_JAR_PACKED_ERROR], 0, MB_ICONERROR);
      LogClose(fLog);
      return 0;
    }
  }
  
  //filename of jar
  string jarname;
  //version 2.1 fix: jar: add absolute path
  //otherwise the temporary tmp file would not be found if not called
  //directly from the exe's folder
  char ftemppath[MAX_PATH + 1];
  GetProgramDir(ftemppath);
  if (jarpacked)
  {
    strcat(ftemppath, &buffer[POS_JAR_PACKED_NAME]);
  }
  else
  {
    strcat(ftemppath, &buffer[POS_JAR_NAME]);
  }
  jarname = (string) ftemppath;
  Log(fLog, (string) "JAR path: " + jarname);
  
  //look if jar exists, if not, show error
  FILE *fJar = fopen(jarname.c_str(), "r");
  if (fJar != NULL)
  {
    fclose(fJar);
  }
  else
  {
    //let the user change this message in later versions
    string s_jarnotfound = "Jar not found:\n" + jarname;
    MessageBox(0, s_jarnotfound.c_str(), 0, MB_ICONERROR);
    return 0;
  }
                                  
  //options
  string options_f1 = "%path%";
  string ProgPathWithoutEndBackSlash = szProgramPath;
  ProgPathWithoutEndBackSlash = ProgPathWithoutEndBackSlash.substr(0, 
    ProgPathWithoutEndBackSlash.length() - 1); 
  string options_r1 = string("\"") + ProgPathWithoutEndBackSlash + string("\"");
  string options = &buffer[POS_OPTIONS];
  Replace(options, options_f1, options_r1);
  Log(fLog, (string) "Options : " + options);

  //arguments
  string arguments_f1 = "%args%";
  string arguments_r1 = "";
  for (int i = 1; i < argc; i++)
  {
    arguments_r1 += string("\"") + argv[i] + string("\" ");
  }
  //MessageBox(0, arguments_r1.c_str(), 0, 0);
  string arguments = &buffer[POS_ARGUMENTS];
  Replace(arguments, arguments_f1, arguments_r1);
  Log(fLog, (string) "Arguments : " + arguments);

  
  string javaargs = 
    //Options...
    options + string(" -jar ") +
    //JAR-file (with complete path)
    string("\"") + jarname + string("\" ") + 
    //Arguments
    arguments;
  Log(fLog, (string) "Java arguments : " + javaargs);

  //MessageBox(0, javaexe.c_str(), 0, 0);
  //MessageBox(0, javaargs.c_str(), 0, 0);

  //ShellExecute(NULL, NULL, javaexe.c_str(), javaargs.c_str(), NULL, SW_HIDE);
  //ShellExecute(NULL, NULL, "javaw", "-classpath \"D:\\C++\\Projekte\\test2\\\" -jar notepad.jar", NULL, SW_HIDE);
  
  DWORD dwReturnCode = 0;
  
  Log(fLog, "Generating ShellExecute information...");
  SHELLEXECUTEINFO SE;
  memset(&SE,0,sizeof(SE));
  SE.fMask = SEE_MASK_NOCLOSEPROCESS ;
  SE.lpFile = javaexe.c_str();
  SE.lpParameters = javaargs.c_str();
  SE.nShow = SW_SHOW;
  SE.cbSize = sizeof(SE);
  Log(fLog, "Starting...");
  ShellExecuteEx(&SE);
  //Delete temporary file at the end, if desired
  if (jarpacked && (buffer[POS_FLAGS + FLAG_JAR_DELETE_AT_END] == '1'))
  {
    //MessageBox(0, "Running", 0, 0);
    if (SE.hProcess)
    {
      WaitForSingleObject(SE.hProcess, INFINITE);
      
      //version 2.1: following line: thanks for this idea
      //to get the return code to Thomas Nenninger!
      GetExitCodeProcess(SE.hProcess, &dwReturnCode);
      
      CloseHandle(SE.hProcess);
    }
    Log(fLog, "Closed. Trying to delete temp Jar file...");
    char ftemppath[MAX_PATH + 1];
    GetProgramDir(ftemppath);
    strcat(ftemppath, &buffer[POS_JAR_PACKED_NAME]);
    remove(ftemppath);
    Log(fLog, "Deleted.");
  }
  else
  {
    //version 2.1: following line: thanks for this idea
    //to get the return code to Thomas Nenninger!
    GetExitCodeProcess(SE.hProcess, &dwReturnCode);
    CloseHandle(SE.hProcess);
    Log(fLog, "Starter closed.");
  }
  
  //getchar ();
  LogClose(fLog);
  //return 0;
  return dwReturnCode;
}
