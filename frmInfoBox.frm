VERSION 5.00
Begin VB.Form frmInfoBox 
   BorderStyle     =   3  'Fester Dialog
   Caption         =   "Info"
   ClientHeight    =   3375
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   5790
   Icon            =   "frmInfoBox.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3375
   ScaleWidth      =   5790
   StartUpPosition =   1  'Fenstermitte
   Begin VB.TextBox txtMessage 
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertikal
      TabIndex        =   2
      Text            =   "frmInfoBox.frx":058A
      Top             =   720
      Width           =   5535
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   345
      Left            =   2160
      TabIndex        =   0
      Top             =   2880
      Width           =   1335
   End
   Begin VB.Label lblTitle 
      Caption         =   "Title of InfoBox"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   3975
   End
End
Attribute VB_Name = "frmInfoBox"
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

Public Sub SetInfo(Title As String, Message As String)
  lblTitle.Caption = Title
  txtMessage.Text = Message
End Sub

Private Sub cmdClose_Click()
  Unload Me
End Sub
