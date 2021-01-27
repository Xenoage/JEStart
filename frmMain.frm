VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Xenoage Java Exe Starter 2.1"
   ClientHeight    =   6105
   ClientLeft      =   150
   ClientTop       =   450
   ClientWidth     =   6000
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   407
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   400
   StartUpPosition =   2  'Bildschirmmitte
   Begin VB.Frame fraMain 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   5295
      Index           =   1
      Left            =   240
      TabIndex        =   0
      Top             =   600
      Width           =   5535
      Begin VB.TextBox locationJRE 
         Height          =   345
         Left            =   240
         MaxLength       =   900
         TabIndex        =   74
         Top             =   4440
         Width           =   5055
      End
      Begin VB.OptionButton optJRE 
         Caption         =   "Use specific location for JRE (with ""\bin"", without exe-filename):"
         Height          =   255
         Index           =   2
         Left            =   0
         TabIndex        =   73
         Top             =   4080
         Width           =   4935
      End
      Begin VB.Frame fraJRE 
         BorderStyle     =   0  'Kein
         Enabled         =   0   'False
         Height          =   2895
         Left            =   240
         TabIndex        =   1
         Top             =   1440
         Width           =   5175
         Begin VB.CheckBox chkJREOrHigher 
            Caption         =   "or higher"
            Enabled         =   0   'False
            Height          =   255
            Left            =   3240
            TabIndex        =   2
            Top             =   280
            Width           =   1815
         End
         Begin VB.TextBox txtJRE 
            Enabled         =   0   'False
            Height          =   345
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   3
            Top             =   240
            Width           =   1335
         End
         Begin VB.CheckBox chkJREStartDespiteError 
            Caption         =   $"frmMain.frx":0E42
            Enabled         =   0   'False
            Height          =   615
            Left            =   0
            TabIndex        =   4
            Top             =   1680
            Width           =   5175
         End
         Begin VB.Label Label9 
            Caption         =   $"frmMain.frx":0EC9
            Height          =   1095
            Left            =   0
            TabIndex        =   5
            Top             =   720
            Width           =   5175
         End
         Begin VB.Label Label8 
            Caption         =   "Required JRE version:"
            Height          =   255
            Left            =   0
            TabIndex        =   6
            Top             =   280
            Width           =   1815
         End
      End
      Begin VB.OptionButton optJRE 
         Caption         =   "Use default JRE (just call java.exe/javaw.exe) - only system-defined error messages will be used!"
         Height          =   375
         Index           =   0
         Left            =   0
         TabIndex        =   8
         Top             =   600
         Value           =   -1  'True
         Width           =   5535
      End
      Begin VB.OptionButton optJRE 
         Caption         =   "Search in registry and use the following JRE:"
         Height          =   255
         Index           =   1
         Left            =   0
         TabIndex        =   7
         Top             =   1200
         Width           =   5535
      End
      Begin VB.Label Label32 
         Caption         =   "Example: D:\Java\jre1.5.0_06\bin"
         Height          =   255
         Left            =   240
         TabIndex        =   75
         Top             =   4920
         Width           =   5175
      End
      Begin VB.Label Label12 
         Caption         =   "Decide which Java Runtime Environment may be used"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   34
         Top             =   120
         Width           =   5535
      End
   End
   Begin VB.Frame fraMain 
      BorderStyle     =   0  'Kein
      Height          =   5295
      Index           =   4
      Left            =   240
      TabIndex        =   35
      Top             =   600
      Width           =   5535
      Begin VB.Label lblDonation 
         Caption         =   "Visit donation website"
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   0
         TabIndex        =   45
         Top             =   4680
         Width           =   1935
      End
      Begin VB.Label Label19 
         Caption         =   $"frmMain.frx":1004
         Height          =   495
         Left            =   0
         TabIndex        =   44
         Top             =   4080
         Width           =   5535
      End
      Begin VB.Label Label15 
         Caption         =   "Support our work with a voluntary donation!"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   43
         Top             =   3720
         Width           =   5535
      End
      Begin VB.Label lblRegister 
         Caption         =   "Write an e-mail to info@xenoage.com"
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   0
         TabIndex        =   42
         Top             =   3240
         Width           =   3015
      End
      Begin VB.Label Label18 
         Caption         =   $"frmMain.frx":109E
         Height          =   495
         Left            =   0
         TabIndex        =   41
         Top             =   2640
         Width           =   5535
      End
      Begin VB.Label Label17 
         Caption         =   "Please tell us about your projects using JEStart!"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   40
         Top             =   2280
         Width           =   5535
      End
      Begin VB.Label Label16 
         Caption         =   "If you only distribute the exe file generated with this software, your project does not need to be released under the GPL too."
         Height          =   495
         Left            =   0
         TabIndex        =   39
         Top             =   1560
         Width           =   5535
      End
      Begin VB.Label lblGnu 
         Caption         =   "Read GNU General Public License"
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   0
         TabIndex        =   38
         Top             =   1200
         Width           =   2775
      End
      Begin VB.Label Label14 
         Caption         =   $"frmMain.frx":1138
         Height          =   615
         Left            =   0
         TabIndex        =   37
         Top             =   480
         Width           =   4095
      End
      Begin VB.Label Label13 
         Caption         =   "Xenoage Java Exe Starter is free software!"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   36
         Top             =   120
         Width           =   4095
      End
      Begin VB.Image imgOpenSource 
         Height          =   465
         Left            =   4200
         MousePointer    =   2  'Kreuz
         Picture         =   "frmMain.frx":11D0
         Top             =   600
         Width           =   1320
      End
      Begin VB.Image imgGnu 
         Height          =   465
         Left            =   4200
         MousePointer    =   2  'Kreuz
         Picture         =   "frmMain.frx":320A
         Top             =   120
         Width           =   1320
      End
   End
   Begin VB.Frame fraMain 
      BorderStyle     =   0  'Kein
      Height          =   5295
      Index           =   0
      Left            =   240
      TabIndex        =   11
      Top             =   600
      Width           =   5535
      Begin VB.OptionButton optJavaExe 
         Caption         =   "Use java.exe (console window may be shown)"
         Height          =   255
         Index           =   1
         Left            =   0
         TabIndex        =   17
         Top             =   2780
         Width           =   4695
      End
      Begin VB.CommandButton cmdIcon32 
         Caption         =   "Load 32 x 32..."
         Height          =   345
         Left            =   2520
         TabIndex        =   28
         Top             =   1440
         Width           =   1455
      End
      Begin VB.CommandButton cmdIcon16 
         Caption         =   "Load 16 x 16..."
         Height          =   345
         Left            =   4080
         TabIndex        =   27
         Top             =   1440
         Width           =   1455
      End
      Begin VB.PictureBox picIcon 
         BorderStyle     =   0  'Kein
         Height          =   240
         Index           =   1
         Left            =   1320
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   24
         Top             =   1560
         Width           =   240
      End
      Begin VB.CommandButton cmdJar 
         Caption         =   "Browse..."
         Height          =   345
         Left            =   4080
         TabIndex        =   22
         Top             =   480
         Width           =   1455
      End
      Begin VB.TextBox txtJAR 
         Height          =   345
         Left            =   0
         MaxLength       =   100
         TabIndex        =   21
         Top             =   480
         Width           =   3975
      End
      Begin VB.CommandButton cmdGenerateExe 
         Caption         =   "Generate Exe..."
         Height          =   345
         Left            =   0
         TabIndex        =   9
         Top             =   4920
         Width           =   1455
      End
      Begin VB.CommandButton cmdSaveSettings 
         Caption         =   "Save Settings..."
         Height          =   345
         Left            =   1560
         TabIndex        =   10
         Top             =   4920
         Width           =   1455
      End
      Begin VB.CommandButton cmdArgumentsHelp 
         Caption         =   "?"
         Height          =   345
         Left            =   5160
         TabIndex        =   12
         Top             =   3960
         Width           =   345
      End
      Begin VB.TextBox txtOptions 
         Height          =   345
         Left            =   1200
         MaxLength       =   2990
         TabIndex        =   13
         Text            =   "-classpath %path%"
         Top             =   3600
         Width           =   3855
      End
      Begin VB.TextBox txtArguments 
         Height          =   345
         Left            =   1200
         MaxLength       =   1990
         TabIndex        =   14
         Text            =   "%args%"
         Top             =   3960
         Width           =   3855
      End
      Begin VB.CommandButton cmdOptionsHelp 
         Caption         =   "?"
         Height          =   345
         Left            =   5160
         TabIndex        =   15
         Top             =   3600
         Width           =   345
      End
      Begin VB.OptionButton optJavaExe 
         Caption         =   "Use javaw.exe (no console window)"
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   16
         Top             =   2520
         Value           =   -1  'True
         Width           =   4695
      End
      Begin VB.PictureBox picIcon 
         BorderStyle     =   0  'Kein
         Height          =   480
         Index           =   0
         Left            =   0
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   18
         Top             =   1440
         Width           =   480
      End
      Begin VB.Label Label30 
         Alignment       =   2  'Zentriert
         Caption         =   "Hint: Use IconEdit32 (freeware) to create 256 color icons"
         Height          =   375
         Left            =   2520
         TabIndex        =   69
         Top             =   1860
         Width           =   3015
      End
      Begin VB.Label Label11 
         Caption         =   "Generate Exe file"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   33
         Top             =   4560
         Width           =   5535
      End
      Begin VB.Label Label10 
         Caption         =   "Arguments:"
         Height          =   255
         Left            =   0
         TabIndex        =   32
         Top             =   4000
         Width           =   1095
      End
      Begin VB.Label Label7 
         Caption         =   "Options:"
         Height          =   255
         Left            =   0
         TabIndex        =   31
         Top             =   3640
         Width           =   1095
      End
      Begin VB.Label Label6 
         Caption         =   "Set options and arguments"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   30
         Top             =   3240
         Width           =   5535
      End
      Begin VB.Label Label5 
         Caption         =   "Select Java executable"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   29
         Top             =   2160
         Width           =   5535
      End
      Begin VB.Label Label4 
         Caption         =   "32 x 32"
         Height          =   255
         Left            =   600
         TabIndex        =   26
         Top             =   1560
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "16 x 16"
         Height          =   255
         Left            =   1680
         TabIndex        =   25
         Top             =   1560
         Width           =   615
      End
      Begin VB.Label Label2 
         Caption         =   "Choose icons for the Exe file"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   23
         Top             =   1080
         Width           =   5535
      End
      Begin VB.Label Label1 
         Caption         =   "Select your executable Jar file"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   20
         Top             =   120
         Width           =   5535
      End
   End
   Begin VB.Frame fraMain 
      BorderStyle     =   0  'Kein
      Height          =   5295
      Index           =   2
      Left            =   240
      TabIndex        =   46
      Top             =   600
      Width           =   5535
      Begin VB.Frame fraPackJar 
         BorderStyle     =   0  'Kein
         Enabled         =   0   'False
         Height          =   3255
         Left            =   240
         TabIndex        =   53
         Top             =   1440
         Width           =   5175
         Begin VB.TextBox txtTempJar 
            Enabled         =   0   'False
            Height          =   345
            Left            =   2040
            MaxLength       =   100
            TabIndex        =   55
            Text            =   "myjar.tmp"
            Top             =   840
            Width           =   3135
         End
         Begin VB.CheckBox chkTempJarDelete 
            Caption         =   "Delete the temporary file, when the application is terminated."
            Enabled         =   0   'False
            Height          =   255
            Left            =   0
            TabIndex        =   54
            Top             =   1440
            Value           =   1  'Aktiviert
            Width           =   5175
         End
         Begin VB.Label Label21 
            Caption         =   "To start the Jar, the Exe file has to extract it to a temporary file, which will be placed in the same directory as the Exe."
            Height          =   495
            Left            =   0
            TabIndex        =   59
            Top             =   120
            Width           =   5175
         End
         Begin VB.Label Label22 
            Caption         =   "Name of temporary file:"
            Height          =   255
            Left            =   0
            TabIndex        =   58
            Top             =   885
            Width           =   1935
         End
         Begin VB.Label Label23 
            Caption         =   $"frmMain.frx":5244
            Height          =   735
            Left            =   240
            TabIndex        =   57
            Top             =   1800
            Width           =   4935
         End
         Begin VB.Label Label24 
            Caption         =   "If this option is not selected, the temporary file will never be deleted but overwritten if the Exe is started again."
            Height          =   615
            Left            =   240
            TabIndex        =   56
            Top             =   2520
            Width           =   4935
         End
      End
      Begin VB.OptionButton optPackJar 
         Caption         =   "Yes, the Exe file should contain and start the Jar (recommended only for small Jar files up to about 3 MB)"
         Height          =   375
         Index           =   1
         Left            =   0
         TabIndex        =   49
         Top             =   1080
         Width           =   5415
      End
      Begin VB.OptionButton optPackJar 
         Caption         =   "No, the Exe file should only be the starter for the Jar"
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   48
         Top             =   600
         Value           =   -1  'True
         Width           =   5415
      End
      Begin VB.Label Label20 
         Caption         =   "Include Jar into the Exe file"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   47
         Top             =   120
         Width           =   5535
      End
   End
   Begin VB.Frame fraMain 
      BorderStyle     =   0  'Kein
      Height          =   5295
      Index           =   3
      Left            =   240
      TabIndex        =   50
      Top             =   600
      Width           =   5535
      Begin VB.TextBox txtErr 
         Height          =   495
         Index           =   3
         Left            =   0
         MaxLength       =   200
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   71
         Top             =   4680
         Width           =   5535
      End
      Begin VB.CommandButton cmdErrDefault 
         Caption         =   "Default"
         Height          =   220
         Index           =   3
         Left            =   4560
         TabIndex        =   70
         Top             =   4440
         Width           =   975
      End
      Begin VB.CommandButton cmdErrDefault 
         Caption         =   "Default"
         Height          =   220
         Index           =   2
         Left            =   4560
         TabIndex        =   68
         Top             =   3360
         Width           =   975
      End
      Begin VB.CommandButton cmdErrDefault 
         Caption         =   "Default"
         Height          =   220
         Index           =   1
         Left            =   4560
         TabIndex        =   67
         Top             =   2280
         Width           =   975
      End
      Begin VB.CommandButton cmdErrDefault 
         Caption         =   "Default"
         Height          =   220
         Index           =   0
         Left            =   4560
         TabIndex        =   66
         Top             =   1200
         Width           =   975
      End
      Begin VB.TextBox txtErr 
         Height          =   495
         Index           =   2
         Left            =   0
         MaxLength       =   200
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   65
         Top             =   3600
         Width           =   5535
      End
      Begin VB.TextBox txtErr 
         Height          =   495
         Index           =   1
         Left            =   0
         MaxLength       =   200
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   63
         Top             =   2520
         Width           =   5535
      End
      Begin VB.TextBox txtErr 
         Height          =   495
         Index           =   0
         Left            =   0
         MaxLength       =   200
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   61
         Top             =   1440
         Width           =   5535
      End
      Begin VB.Label Label31 
         Caption         =   "Error message, if an error occurred while extracting the temporary Jar file (Exe must be corrupt):"
         Height          =   495
         Left            =   0
         TabIndex        =   72
         Top             =   4200
         Width           =   5535
      End
      Begin VB.Label Label29 
         Caption         =   "Error message, if registry could not be read (should not happen normally, the Java installation seems to be corrupt):"
         Height          =   495
         Left            =   0
         TabIndex        =   64
         Top             =   3120
         Width           =   5535
      End
      Begin VB.Label Label28 
         Caption         =   "Error message, if no suitable JRE could be found (e.g. if the Jar needs at least JRE 1.5.0 but only 1.4.2 is installed):"
         Height          =   495
         Left            =   0
         TabIndex        =   62
         Top             =   2040
         Width           =   5535
      End
      Begin VB.Label Label27 
         Caption         =   "Error message, if no JRE could be found:"
         Height          =   255
         Left            =   0
         TabIndex        =   60
         Top             =   1200
         Width           =   5535
      End
      Begin VB.Label Label26 
         Caption         =   $"frmMain.frx":5314
         Height          =   615
         Left            =   0
         TabIndex        =   52
         Top             =   480
         Width           =   5535
      End
      Begin VB.Label Label25 
         Caption         =   "Define error messages"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   51
         Top             =   120
         Width           =   5535
      End
   End
   Begin MSComDlg.CommonDialog dlgMain 
      Left            =   5400
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin MSComctlLib.TabStrip tabMain 
      Height          =   5895
      Left            =   120
      TabIndex        =   19
      Top             =   120
      Width           =   5775
      _ExtentX        =   10186
      _ExtentY        =   10398
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   5
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "General"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "JRE"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Pack Jar"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Messages"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "License"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuFileOpen 
         Caption         =   "Open Settings..."
      End
      Begin VB.Menu mnuFileSave 
         Caption         =   "Save Settings..."
      End
      Begin VB.Menu mnuFileSep0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileExe 
         Caption         =   "Generate Exe file..."
      End
      Begin VB.Menu mnuFileSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuFileHelp 
      Caption         =   "?"
      Begin VB.Menu mnuHelpTutorial 
         Caption         =   "Read Tutorial..."
      End
      Begin VB.Menu mnuHelpLicense 
         Caption         =   "Read License..."
      End
      Begin VB.Menu mnuHelpSep0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHelpWebsite 
         Caption         =   "Visit JEStart website..."
      End
      Begin VB.Menu mnuHelpSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHelpInfo 
         Caption         =   "About..."
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'This file is part of Xenoage Java Exe Starter.
'
'Xenoage Java Exe Starter is free software; you can redistribute it and/or modify
'it under the terms of the GNU General Public License as published by
'the Free Software Foundation; either version 2 of the License, or
'(at your option) any later version.
'
'Xenoage Java Exe Starter is distributed in the hope that it will be useful,
'but WITHOUT ANY WARRANTY; without even the implied warranty of
'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'GNU General Public License for more details.
'
'You should have received a copy of the GNU General Public License
'along with Xenoage Java Exe Starter; if not, write to the Free Software
'Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

Option Explicit

Private FileIcon As New cFileIcon
Private LastPath As String
Private JEStartFilePath As String
Private Icon32Path As String
Private Icon16Path As String



'Generate Exe file
Private Sub cmdGenerateExe_Click()
  On Error GoTo ERR_OUT

  'Check if all necessary settings were made
  If (Len(Trim(SplitFileFromPath(txtJAR.Text))) = 0) Then
    MsgBox "Please choose a Jar file!", vbExclamation
    Exit Sub
  ElseIf (Dir(txtJAR.Text, vbNormal) = "") Then
    MsgBox "Please choose a existing Jar file!", vbExclamation
    Exit Sub
  End If
  
  'Let the user select a path and a filename
  On Error GoTo DLG_CANCEL
  Dim ExePath As String
  With dlgMain
    .DialogTitle = "Generate Exe file"
    .Flags = cdlOFNPathMustExist Or cdlOFNOverwritePrompt
    .Filter = "Windows Executables (.exe)|*.exe"
    .InitDir = LastPath
    .Filename = Replace(txtJAR.Text, ".jar", ".exe")
    .ShowSave
    ExePath = .Filename
  End With
  
  'Copy and edit the template file
  On Error GoTo ERR_OUT
  If (Len(ExePath) > 0) Then
  
    Dim JarPath As String
    JarPath = SplitFileFromPath(txtJAR.Text)
    
    'if Jar and Exe are not in the same path, tell the user
    'that a relative path will be used. user can cancel the process.
    If (optPackJar(0).Value) Then
      If (SplitDirFromPath(ExePath) <> SplitDirFromPath(txtJAR.Text)) Then
        JarPath = GetRelativePath(SplitDirFromPath(ExePath), _
          txtJAR.Text, True)
        If (MsgBox("The Exe and the Jar files are not in the same path," & vbCrLf & _
          "thus this relative path for the Jar will be used:" & vbCrLf & _
          JarPath & vbCrLf & "Continue?", vbYesNoCancel Or vbQuestion) <> vbYes) Then
          Exit Sub
        End If
      End If
    End If
  
    LastPath = ExePath
    FileSystem.FileCopy App.Path & "\s.dat", ExePath
    
    'find buffer start position
    Dim BufferStart As Long
    BufferStart = FindStringInFile("%XNG_JESTART_BUFFER%", ExePath)
    
    Dim temp As String
    Dim path2java As String
    Dim Pos As Long
    Dim NullChar As Byte
    NullChar = 0
    Dim FileNr As Integer
    FileNr = FreeFile()
    
    Open ExePath For Binary As FileNr
    
      'jar name (relative path)
      temp = StringCut(JarPath, LEN_JAR_NAME - 1)
      Pos = BufferStart + POS_JAR_NAME
      Put #FileNr, Pos, temp
      Put #FileNr, Pos + Len(temp), NullChar
      
      If (optJRE(2).Value) Then
        path2java = locationJRE.Text & "\"
      Else
        path2java = ""
      End If
      
      'java.exe or javaw.exe
      If (optJavaExe(0).Value = True) Then
        temp = path2java & "javaw.exe"
      Else
        temp = path2java & "java.exe"
      End If
      
      Pos = BufferStart + POS_JAVA_EXE
      Put #FileNr, Pos, temp
      Put #FileNr, Pos + Len(temp), NullChar

      'jre required, flag: start without registry
      If (optJRE(1).Value) Then
        Put #FileNr, BufferStart + POS_FLAGS + FLAG_START_WITHOUT_REGISTRY, "0"
        temp = txtJRE.Text
        Pos = BufferStart + POS_JRE_REQUIRED
        Put #FileNr, Pos, temp
        Put #FileNr, Pos + Len(temp), NullChar
      Else
        Put #FileNr, BufferStart + POS_FLAGS + FLAG_START_WITHOUT_REGISTRY, "1"
      End If
      
      'options
      temp = StringCut(txtOptions.Text, LEN_OPTIONS - 1)
      Pos = BufferStart + POS_OPTIONS
      Put #FileNr, Pos, temp
      Put #FileNr, Pos + Len(temp), NullChar

      'arguments
      temp = StringCut(txtArguments.Text, LEN_ARGUMENTS - 1)
      Pos = BufferStart + POS_ARGUMENTS
      Put #FileNr, Pos, temp
      Put #FileNr, Pos + Len(temp), NullChar
      
      'error: jre not found
      temp = StringCut(PackErrMessage(0), LEN_ERR_JRE_NOT_FOUND - 1)
      Pos = BufferStart + POS_ERR_JRE_NOT_FOUND
      Put #FileNr, Pos, temp
      Put #FileNr, Pos + Len(temp), NullChar
      
      'error: jre wrong version
      temp = StringCut(PackErrMessage(1), LEN_ERR_JRE_WRONG_VERSION - 1)
      Pos = BufferStart + POS_ERR_JRE_WRONG_VERSION
      Put #FileNr, Pos, temp
      Put #FileNr, Pos + Len(temp), NullChar
      
      'error: jre error
      temp = StringCut(PackErrMessage(2), LEN_ERR_JRE_ERROR - 1)
      Pos = BufferStart + POS_ERR_JRE_ERROR
      Put #FileNr, Pos, temp
      Put #FileNr, Pos + Len(temp), NullChar
      
      'error: jar packed error
      temp = StringCut(PackErrMessage(3), LEN_ERR_JAR_PACKED_ERROR - 1)
      Pos = BufferStart + POS_ERR_JAR_PACKED_ERROR
      Put #FileNr, Pos, temp
      Put #FileNr, Pos + Len(temp), NullChar
      
      'jar packed name
      temp = StringCut(txtTempJar.Text, LEN_JAR_PACKED_NAME - 1)
      Pos = BufferStart + POS_JAR_PACKED_NAME
      Put #FileNr, Pos, temp
      Put #FileNr, Pos + Len(temp), NullChar
      
      'flag: start despite registry error
      Pos = BufferStart + POS_FLAGS + FLAG_START_DESPITE_REGISTRY_ERROR
      If (chkJREStartDespiteError.Value = vbChecked) Then
        Put #FileNr, Pos, "1"
      Else
        Put #FileNr, Pos, "0"
      End If
      
      'flag: jre required or higher
      Pos = BufferStart + POS_FLAGS + FLAG_JRE_REQUIRED_OR_HIGHER
      If (chkJREOrHigher.Value = vbChecked) Then
        Put #FileNr, Pos, "1"
      Else
        Put #FileNr, Pos, "0"
      End If
      
      'flag: jar packed
      Pos = BufferStart + POS_FLAGS + FLAG_JAR_PACKED
      If (optPackJar(1).Value) Then
        Put #FileNr, Pos, "1"
      Else
        Put #FileNr, Pos, "0"
      End If
      
      'flag: temp jar delete at end
      Pos = BufferStart + POS_FLAGS + FLAG_JAR_DELETE_AT_END
      If (chkTempJarDelete.Value = vbChecked) Then
        Put #FileNr, Pos, "1"
      Else
        Put #FileNr, Pos, "0"
      End If
      

      'icon 32 x 32 x 256 data
      Dim IconData As String
      If (ReadIconImageData(Icon32Path, 32, 32, 8, IconData)) Then
        Put #FileNr, POS_ICON_32, IconData
      End If

      'icon 16 x 16 x 256 data
      If (ReadIconImageData(Icon16Path, 16, 16, 8, IconData)) Then
        Put #FileNr, POS_ICON_16, IconData
      End If
    
    Close FileNr
    
    'pack jar if desired
    If (optPackJar(1).Value) Then
    
      'read jar file into memory
      Dim dataJar() As Byte
      FileNr = FreeFile()
      Open txtJAR.Text For Binary As #FileNr
      ReDim dataJar(0 To LOF(FileNr) - 1)
      Get #FileNr, , dataJar
      Close #FileNr
      
      'append it to the exe file
      FileNr = FreeFile()
      Open ExePath For Binary As #FileNr
      Seek #FileNr, FileLen(ExePath)
      Put #FileNr, , "%XNG_JESTART_JAR_PACKED%" 'start sign
      Put #FileNr, , dataJar
      Close #FileNr
      
    End If
    
  End If
  
  Exit Sub
ERR_OUT:
  MsgBox "An error occurred while generating the exe file!" & vbCrLf & _
    Err.Number & ": " & Err.Description, vbCritical
  Close FileNr
DLG_CANCEL:
End Sub

Private Function PackErrMessage(Index As Integer) As String
  Dim ret As String
  ret = txtErr(Index).Text
  ret = Replace(ret, "%jre%", txtJRE.Text)
  'ret = Replace(ret, vbCrLf, "\n")
  PackErrMessage = ret
End Function

Private Sub cmdOptionsHelp_Click()
  frmInfoBox.SetInfo "Command line options", _
    "In this textbox you can specify options for the Java VM, e.g. ""-classpath"" or ""-verbose"". ""-jar"" is automatically set." & vbCrLf & "Use ""%path%"" as a placeholder for the path, where your exe is started." & vbCrLf & vbCrLf & "Default value:" & vbCrLf & "-classpath %path%"
  frmInfoBox.Show vbModal
End Sub

Private Sub cmdArgumentsHelp_Click()
  frmInfoBox.SetInfo "Command line arguments", _
    "This textbox contains the arguments which are passed to your program." & vbCrLf & "Write ""%args%"" to use the same arguments which are passed to the exe file." & vbCrLf & vbCrLf & "Default value (recommended):" & vbCrLf & "%args%"
  frmInfoBox.Show vbModal
End Sub

Private Sub cmdSaveSettings_Click()
  mnuFileSave_Click
End Sub

Private Sub Form_Load()
  On Error Resume Next
  Dim i As Long
  'Show first tab
  tabMain.Tabs(1).Selected = True
  tabMain_Click
  'Load default icons
  Icon32Path = App.Path & "\i.dat"
  Icon16Path = App.Path & "\i.dat"
  FileIcon.LoadIcon Icon32Path
  Set picIcon(0).Picture = FileIcon.IconPicture(picIcon(0).hdc, 1)
  Set picIcon(1).Picture = FileIcon.IconPicture(picIcon(1).hdc, 2)
  'Load default JRE settings
  optJRE(Val(InputINI(App.Path & "\jestart.ini", "jre", "registry"))).Value = True
  txtJRE.Text = InputINI(App.Path & "\jestart.ini", "jre", "version")
  chkJREOrHigher.Value = _
    Val(InputINI(App.Path & "\jestart.ini", "jre", "orhigher"))
  chkJREStartDespiteError.Value = _
    Val(InputINI(App.Path & "\jestart.ini", "jre", "startonerror"))
  'Load default messages
  For i = 0 To txtErr.UBound
    LoadDefaultMessage i
  Next
End Sub

Private Sub cmdJar_Click()
  Dim NewPath As String
  On Error GoTo DLG_CANCEL
  With dlgMain
    .DialogTitle = "Select executable Jar file"
    .Flags = cdlOFNFileMustExist Or cdlOFNHideReadOnly
    .Filter = "Java Archives (.jar)|*.jar|All files|*.*"
    .InitDir = LastPath
    .Filename = txtJAR.Text
    .ShowOpen
    NewPath = .Filename
  End With
  On Error Resume Next
  If (Len(NewPath) > 0) Then
    LastPath = NewPath
    txtJAR.Text = NewPath
    Dim TempFilename As String
    TempFilename = Replace(dlgMain.FileTitle, ".jar", ".tmp")
    txtTempJar = TempFilename
  End If
  Exit Sub
DLG_CANCEL:
End Sub

Private Sub cmdIcon32_Click()
  Dim NewPath As String
  On Error GoTo DLG_CANCEL
  With dlgMain
    .DialogTitle = "Select 32 x 32 icon"
    .Flags = cdlOFNFileMustExist Or cdlOFNHideReadOnly
    .Filter = "Icons (.ico)|*.ico|All files|*.*"
    .InitDir = LastPath
    .Filename = Icon32Path
    .ShowOpen
    NewPath = .Filename
  End With
  On Error Resume Next
  If (Len(NewPath) > 0) Then
    LastPath = NewPath
    FileIcon.LoadIcon NewPath
    If ((FileIcon.ImageCount = 0) Or (FileIcon.ImageCount > 255)) Then '< 255: seems not to be a real icon file
      MsgBox "There seem to be no icons in this file.", vbExclamation
    Else
      Dim i As Long
      For i = 1 To FileIcon.ImageCount
        If ((FileIcon.ImageWidth(i) = 32) And _
            (FileIcon.ImageHeight(i) = 32) And _
            (FileIcon.ImageColourCount(i) = 256)) Then
          Icon32Path = NewPath
          Set picIcon(0).Picture = FileIcon.IconPicture(picIcon(0).hdc, i)
          Exit Sub
        End If
      Next
      MsgBox "There is no 32 x 32 icon with 256 colors in this file.", vbExclamation
    End If
  End If
  Exit Sub
DLG_CANCEL:
End Sub


Private Sub cmdIcon16_Click()
  Dim NewPath As String
  On Error GoTo DLG_CANCEL
  With dlgMain
    .DialogTitle = "Select 16 x 16 icon"
    .Flags = cdlOFNFileMustExist Or cdlOFNHideReadOnly
    .Filter = "Icons (.ico)|*.ico|All files|*.*"
    .InitDir = LastPath
    .Filename = Icon16Path
    .ShowOpen
    NewPath = .Filename
  End With
  On Error Resume Next
  If (Len(NewPath) > 0) Then
    LastPath = NewPath
    FileIcon.LoadIcon NewPath
    If ((FileIcon.ImageCount = 0) Or (FileIcon.ImageCount > 255)) Then '< 255: seems not to be a real icon file
      MsgBox "There seem to be no icons in this file.", vbExclamation
    Else
      Dim i As Long
      For i = 1 To FileIcon.ImageCount
        If ((FileIcon.ImageWidth(i) = 16) And _
            (FileIcon.ImageHeight(i) = 16) And _
            (FileIcon.ImageColourCount(i) = 256)) Then
          Icon16Path = NewPath
          Set picIcon(1).Picture = FileIcon.IconPicture(picIcon(1).hdc, i)
          Exit Sub
        End If
      Next
      MsgBox "There is no 16 x 16 icon with 256 colors in this file.", vbExclamation
    End If
  End If
  Exit Sub
DLG_CANCEL:
End Sub


Private Sub cmdRegister_Click()
  OpenURL Me.hWnd, "mailto:info@xenoage.com?subject=" & _
    App.ProductName & " " & App.Major & "." & App.Minor
End Sub


Private Sub imgGnu_Click()
  OpenURL Me.hWnd, "http://www.gnu.org"
End Sub

Private Sub imgOpenSource_Click()
  OpenURL Me.hWnd, "http://www.opensource.org"
End Sub

Private Sub lblDonation_Click()
  OpenURL Me.hWnd, "http://www.xenoage.com/donate/"
End Sub

Private Sub lblGnu_Click()
  OpenURL Me.hWnd, App.Path & "\license.txt"
End Sub

Private Sub lblRegister_Click()
  OpenURL Me.hWnd, "mailto:info@xenoage.com?subject=" & _
    App.ProductName & " " & App.Major & "." & App.Minor
End Sub

Private Sub mnuFileExe_Click()
  cmdGenerateExe_Click
End Sub

Private Sub mnuFileExit_Click()
  Unload Me
End Sub

Private Sub mnuFileOpen_Click()
  Dim NewPath As String
  On Error GoTo DLG_CANCEL
  With dlgMain
    .DialogTitle = "Open Java Exe Starter file"
    .Flags = cdlOFNFileMustExist Or cdlOFNHideReadOnly
    .Filter = "Xenoage Java Exe Starter (.jestart)|*.jestart|All files|*.*"
    .InitDir = LastPath
    .Filename = JEStartFilePath
    .ShowOpen
    NewPath = .Filename
  End With
  On Error GoTo ERR_OUT
  If (Len(NewPath) > 0) Then
    LastPath = NewPath
    JEStartFilePath = NewPath
    Dim temp As String
    Dim i As Long
    Dim FileNr As Integer
    FileNr = FreeFile()
    Open NewPath For Input As FileNr
    
      Line Input #FileNr, temp
      If (temp <> "#XenoageJavaExeStarter_2_1") Then
        MsgBox "This is no Java Exe Starter (version 2.1) file!" & vbCrLf & _
          "Please notice that files from version 1.0/2.0 can not be opened!", vbCritical
        Exit Sub
      End If
      
      'Tab 1
      Line Input #FileNr, temp
      txtJAR.Text = temp
      
      Line Input #FileNr, temp
      Icon32Path = temp
      FileIcon.LoadIcon Icon32Path
      For i = 1 To FileIcon.ImageCount
        If ((FileIcon.ImageWidth(i) = 32) And _
            (FileIcon.ImageHeight(i) = 32) And _
            (FileIcon.ImageColourCount(i) = 256)) Then
          Set picIcon(0).Picture = FileIcon.IconPicture(picIcon(0).hdc, i)
          Exit For
        End If
      Next
      
      Line Input #FileNr, temp
      Icon16Path = temp
      FileIcon.LoadIcon Icon16Path
      For i = 1 To FileIcon.ImageCount
        If ((FileIcon.ImageWidth(i) = 16) And _
            (FileIcon.ImageHeight(i) = 16) And _
            (FileIcon.ImageColourCount(i) = 256)) Then
          Set picIcon(1).Picture = FileIcon.IconPicture(picIcon(1).hdc, i)
          Exit For
        End If
      Next
      
      Line Input #FileNr, temp
      optJavaExe(Val(temp)).Value = True
      
      Line Input #FileNr, temp
      txtOptions.Text = temp
      
      Line Input #FileNr, temp
      txtArguments.Text = temp
      
      'Tab 2
      Line Input #FileNr, temp
      optJRE(Val(temp)).Value = True
      
      Line Input #FileNr, temp
      txtJRE.Text = temp
      
      Line Input #FileNr, temp
      chkJREOrHigher.Value = Val(temp)
      
      Line Input #FileNr, temp
      chkJREStartDespiteError.Value = Val(temp)
      
      Line Input #FileNr, temp
      locationJRE.Text = temp
      
      'Tab 3
      Line Input #FileNr, temp
      optPackJar(Val(temp)).Value = True
      
      Line Input #FileNr, temp
      txtTempJar.Text = temp
      
      Line Input #FileNr, temp
      chkTempJarDelete.Value = Val(temp)

      'Tab 4
      For i = 0 To txtErr.UBound
        Line Input #FileNr, temp
        txtErr(i).Text = Replace(temp, "\n", vbCrLf)
      Next
      
    Close FileNr
  End If
  
  Exit Sub
ERR_OUT:
  MsgBox "An error occurred while loading the file!" & vbCrLf & _
    Err.Number & ": " & Err.Description, vbCritical
  Close FileNr
  Exit Sub
DLG_CANCEL:
End Sub

Private Sub mnuFileSave_Click()
  Dim NewPath As String
  On Error GoTo DLG_CANCEL
  With dlgMain
    .DialogTitle = "Save Java Exe Starter file"
    .Flags = cdlOFNPathMustExist Or cdlOFNOverwritePrompt
    .Filter = "Xenoage Java Exe Starter (.jestart)|*.jestart|All files|*.*"
    .InitDir = LastPath
    .Filename = JEStartFilePath
    .ShowSave
    NewPath = .Filename
  End With
  On Error Resume Next
  If (Len(NewPath) > 0) Then
    LastPath = NewPath
    JEStartFilePath = NewPath
    Dim FileNr As Integer
    FileNr = FreeFile()
    Open NewPath For Output As FileNr
      Print #FileNr, "#XenoageJavaExeStarter_2_1"
      'Tab 1
      Print #FileNr, txtJAR.Text
      Print #FileNr, Icon32Path
      Print #FileNr, Icon16Path
      Print #FileNr, CStr(IIf(optJavaExe(0).Value, "0", "1"))
      Print #FileNr, txtOptions.Text
      Print #FileNr, txtArguments.Text
      'Tab 2
      Dim optJRENr As Integer
      If (optJRE(0).Value) Then
        optJRENr = 0
      ElseIf (optJRE(1).Value) Then
        optJRENr = 1
      Else
        optJRENr = 2
      End If
      Print #FileNr, CStr(optJRENr)
      Print #FileNr, txtJRE.Text
      Print #FileNr, CStr(IIf(chkJREOrHigher.Value = vbChecked, "1", "0"))
      Print #FileNr, CStr(IIf(chkJREStartDespiteError.Value = vbChecked, "1", "0"))
      Print #FileNr, locationJRE.Text
      'Tab 3
      Print #FileNr, CStr(IIf(optPackJar(0).Value, "0", "1"))
      Print #FileNr, txtTempJar.Text
      Print #FileNr, CStr(IIf(chkTempJarDelete.Value = vbChecked, "1", "0"))
      'Tab 4
      Dim i As Integer
      For i = 0 To txtErr.UBound
        Print #FileNr, Replace(txtErr(i).Text, vbCrLf, "\n")
      Next
    Close FileNr
  End If
  Exit Sub
DLG_CANCEL:
End Sub

Private Sub mnuHelpInfo_Click()
  frmAbout.Show vbModal
End Sub

Private Sub mnuHelpLicense_Click()
  OpenURL Me.hWnd, App.Path & "\license.txt"
End Sub

Private Sub mnuHelpTutorial_Click()
  OpenURL Me.hWnd, App.Path & "\tutorial.txt"
End Sub

Private Sub mnuHelpWebsite_Click()
  OpenURL Me.hWnd, "http://www.xenoage.com/jestart/"
End Sub

Private Sub optJRE_Click(Index As Integer)
  Dim a As Boolean
  a = optJRE(0).Value
  Dim b As Boolean
  b = optJRE(1).Value
  Dim c As Boolean
  c = optJRE(2).Value
  
  fraJRE.Enabled = b
  txtJRE.Enabled = b
  chkJREOrHigher.Enabled = b
  chkJREStartDespiteError.Enabled = b
  a = optJRE(0).Value
  b = optJRE(1).Value
  c = optJRE(2).Value
  
  If (a) Then
    fraJRE.Enabled = False
    txtJRE.Enabled = False
    chkJREOrHigher.Enabled = False
    chkJREStartDespiteError.Enabled = False
    locationJRE.Enabled = False
  Else
    If (b) Then
        fraJRE.Enabled = True
        txtJRE.Enabled = True
        chkJREOrHigher.Enabled = True
        chkJREStartDespiteError.Enabled = True
        locationJRE.Enabled = False
    Else
        fraJRE.Enabled = False
        txtJRE.Enabled = False
        chkJREOrHigher.Enabled = False
        chkJREStartDespiteError.Enabled = False
        locationJRE.Enabled = True
    End If
  End If

End Sub

Private Sub optPackJar_Click(Index As Integer)
  Dim b As Boolean
  b = optPackJar(1).Value
  
  fraPackJar.Enabled = b
  txtTempJar.Enabled = b
  chkTempJarDelete.Enabled = b
  
End Sub

Private Sub tabMain_Click()
  On Error Resume Next
  Dim i As Long
  For i = 0 To tabMain.Tabs.Count - 1
    fraMain(i).Visible = (i = tabMain.SelectedItem.Index - 1)
  Next
End Sub

Private Sub cmdErrDefault_Click(Index As Integer)
  If (MsgBox("Restore default error message?", _
    vbQuestion Or vbYesNoCancel) = vbYes) Then
      LoadDefaultMessage Index
  End If
End Sub

Private Sub LoadDefaultMessage(ByVal Index As Long)
  If ((Index >= 0) And (Index <= txtErr.UBound)) Then
    Dim s As String
    s = InputINI(App.Path & "\jestart.ini", "messages", "err" & (Index + 1))
    s = Replace(s, "\n", vbCrLf)
    txtErr(Index) = s
  End If
End Sub
