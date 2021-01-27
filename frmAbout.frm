VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fester Dialog
   Caption         =   "About Xenoage Java Exe Starter"
   ClientHeight    =   4035
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   5805
   ClipControls    =   0   'False
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2785.029
   ScaleMode       =   0  'Benutzerdefiniert
   ScaleWidth      =   5451.195
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'Fenstermitte
   Begin VB.PictureBox picIcon 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'Kein
      ClipControls    =   0   'False
      Height          =   480
      Index           =   1
      Left            =   240
      Picture         =   "frmAbout.frx":058A
      ScaleHeight     =   337.12
      ScaleMode       =   0  'Benutzerdefiniert
      ScaleWidth      =   337.12
      TabIndex        =   11
      Top             =   840
      Width           =   480
   End
   Begin VB.PictureBox picIcon 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'Kein
      ClipControls    =   0   'False
      Height          =   480
      Index           =   0
      Left            =   240
      Picture         =   "frmAbout.frx":0E54
      ScaleHeight     =   337.12
      ScaleMode       =   0  'Benutzerdefiniert
      ScaleWidth      =   337.12
      TabIndex        =   1
      Top             =   240
      Width           =   480
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   4320
      TabIndex        =   0
      Top             =   3120
      Width           =   1260
   End
   Begin VB.CommandButton cmdDonate 
      Caption         =   "Donate..."
      Height          =   345
      Left            =   4320
      TabIndex        =   2
      Top             =   3600
      Width           =   1245
   End
   Begin VB.Label lblLink 
      Caption         =   "info@xenoage.com"
      ForeColor       =   &H00C00000&
      Height          =   255
      Index           =   1
      Left            =   2640
      TabIndex        =   10
      Top             =   2640
      Width           =   2655
   End
   Begin VB.Label lblLink 
      Caption         =   "http://www.xenoage.com/jestart/"
      ForeColor       =   &H00C00000&
      Height          =   255
      Index           =   0
      Left            =   2640
      TabIndex        =   9
      Top             =   2400
      Width           =   2655
   End
   Begin VB.Label lblContact 
      Caption         =   "E-Mail:"
      Height          =   255
      Index           =   1
      Left            =   1080
      TabIndex        =   8
      Top             =   2640
      Width           =   1575
   End
   Begin VB.Label lblContact 
      Caption         =   "Homepage:"
      Height          =   255
      Index           =   0
      Left            =   1080
      TabIndex        =   7
      Top             =   2400
      Width           =   1575
   End
   Begin VB.Label lblDescription 
      Caption         =   $"frmAbout.frx":1C96
      ForeColor       =   &H00000000&
      Height          =   1170
      Left            =   1080
      TabIndex        =   3
      Top             =   1080
      Width           =   4605
   End
   Begin VB.Label lblTitle 
      Caption         =   "Xenoage Java Exe Starter 2.0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   480
      Left            =   1080
      TabIndex        =   5
      Top             =   240
      Width           =   3885
   End
   Begin VB.Label lblVersion 
      Caption         =   "(c) 2005 by Andreas Wenger, Xenoage Software"
      Height          =   225
      Left            =   1050
      TabIndex        =   6
      Top             =   720
      Width           =   3885
   End
   Begin VB.Label lblDisclaimer 
      Caption         =   $"frmAbout.frx":1E08
      ForeColor       =   &H00000000&
      Height          =   825
      Left            =   120
      TabIndex        =   4
      Top             =   3120
      Width           =   4095
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Innen ausgefüllt
      Index           =   1
      X1              =   112.686
      X2              =   5337.57
      Y1              =   2070.654
      Y2              =   2070.654
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   0
      X1              =   126.772
      X2              =   5337.57
      Y1              =   2081.007
      Y2              =   2081.007
   End
End
Attribute VB_Name = "frmAbout"
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


Private Sub cmdDonate_Click()
  OpenURL Me.hWnd, "http://www.xenoage.com/donate/"
End Sub

Private Sub cmdOK_Click()
  Unload Me
End Sub


Private Sub lblLink_Click(Index As Integer)
  If Index = 0 Then
    OpenURL Me.hWnd, lblLink(0).Caption
  Else
    OpenURL Me.hWnd, "mailto:" & lblLink(1).Caption
  End If
End Sub


