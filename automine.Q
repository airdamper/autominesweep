[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=4abaf1c2-6d23-4518-bc6a-950cd3a483d3
Description=Mine����_�Զ�����
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[Script]
MineWin = Plugin.Window.Find(0, "ɨ��")
//���Ͻǵ�һ�����ӵ�λ��
ox = 13
oy = 55
dt = 20
win_x = 0
win_y = 0

//��ô��ڳߴ磬�����������
sRect = Plugin.Window.GetWindowRect(MineWin)
dim size   
size = Split(sRect, "|")
win_x = size(0)
win_y = size(1)
countX = ((size(2) - size(0)) - 26) / 16
countY = (size(3) - size(1) - 112) / 16
TracePrint "size: " & countX & "," & countY
TracePrint "winPos:" & win_x & "," & win_y

//��ʱ�������
Redim exist_list(10)
exist_index = 0


//ReDim list(5)
//list(0) = 1
//TracePrint UBound(list)
//list(5) = 9
//TracePrint UBound(list)
//Redim Preserve list(15)
//TracePrint list(5)
//TracePrint UBound(list)
//Redim Preserve list(0)
//Redim Preserve list(15)
//TracePrint list(5)


//��������״̬
Redim mineData(countX-1,countY-1)
//����״̬
For i = 0 To countY - 1
	For j = 0 To countX - 1
		mineData(j, i) = TileState(j, i)
		//mineData(j, i) = TileState01(j, i)
		//Delay dt
	Next
Next
//WriteToTxt mineData, countX, countY

boo = 1
While boo = 1
	f01 = flag01()
	c01 = click01()
	If f01 + c01 = 0 Then 
		boo = 0
	End If
//	Call Plugin.Bkgnd.KeyPress(txtHwnd, 13)
//	WriteToTxt mineData, countX, countY

//	While not exist_index = 0 
//		l_xy = Split(exist_list(0), "|")
//		temp_x = l_xy(0)
//		temp_y = l_xy(1)
//		flag_one temp_x,temp_y
//		click_one temp_x,temp_y
//		remove_exist_list temp_x,temp_y
//	Wend

	//list = copy_exist_to_list()
	//While not UBound(list) = 0 
//		For list_i=0 to UBound(list)
//			l_xy = Split(list(list_i), "|")
//			temp_x = l_xy(0)
//			temp_y = l_xy(1)
//			flag_one temp_x,temp_y
//			click_one temp_x, temp_y
//			list_i=list_i+1
//		Next
//		list = copy_exist_to_list()
//	Wend
	
	

Wend


Function copy_exist_to_list()
	Redim result(exist_index)
	copy_i=0
	For exist_index
		result(copy_i) = exist_list(copy_i) 
		copy_i=copy_i+1
	Next
	reset_exist_list 
	copy_exist_to_list = result
End Function


//���  ��ǰ���� = n+f �Ͱ����е�n���f
Function flag01
	flag01 = 0
	For i = 0 To countY - 1
		For j = 0 To countX - 1
			n_count = get_count(j, i, "N")
			//TracePrint "flag:"&i
			If mineData(j, i) = n_count + get_count(j, i, "F") Then 
				If not n_count = 0  Then 
					change_n_to_f j, i
					flag01 = flag01+1
				End If
			End If
		Next
	Next
End Function
Function click01
	click01 = 0
	For i = 0 To countY - 1
		For j = 0 To countX - 1
		//TracePrint "click:" & i
			If mineData(j, i) = get_count(j, i, "F") Then 
				n_count = get_count(j, i, "N")
				If not n_count = 0  Then 
					change_n_to_x j, i
					click01 = click01 + 1
				End If
			End If
		Next
	Next
End Function


Function flag_one(x, y)
	n_count = get_count(x, y, "N")
	If mineData(x, y) = n_count + get_count(x, y, "F") Then 
		If not n_count = 0  Then 
			change_n_to_f x, y
		End If
	End If
End Function
Function click_one(x, y)
	If mineData(x, y) = get_count(x, y, "F") Then 
		n_count = get_count(x, y, "N")
		If not n_count = 0  Then 
			change_n_to_x x, y
		End If
	End If
End Function

//InitData
//For i = 0 To countY - 1
//	For j = 0 To countX - 1
//		check01 i,j
//	Next
//Next
//TracePrint mineData(1, 1)
//t = "2"
//TracePrint get_count(0,0, t)



//��Χ����û�㿪�ļ���  N=>F
Function change_n_to_f(x,y)
	change_from_to_clamp x-1, y-1,"N","F"
	change_from_to_clamp x  , y-1,"N","F"
	change_from_to_clamp x+1, y-1,"N","F"
	change_from_to_clamp x+1, y  ,"N","F"
	change_from_to_clamp x+1, y+1,"N","F"
	change_from_to_clamp x  , y+1,"N","F"
	change_from_to_clamp x-1, y+1,"N","F"
	change_from_to_clamp x - 1, y,"N","F"
End Function
//�㿪��Χ����
Function change_n_to_x(x,y)
	change_from_to_clamp x-1, y-1,"N","X"
	change_from_to_clamp x  , y-1,"N","X"
	change_from_to_clamp x+1, y-1,"N","X"
	change_from_to_clamp x+1, y  ,"N","X"
	change_from_to_clamp x+1, y+1,"N","X"
	change_from_to_clamp x  , y+1,"N","X"
	change_from_to_clamp x-1, y+1,"N","X"
	change_from_to_clamp x - 1, y,"N","X"
End Function
//�����N=>F�Ҽ�����������N=>X������
Function change_from_to_clamp(x, y, f, t)
	If x < 0 or y < 0 or x >= countX or y >= countY Then 
	Else 
		If mineData(x, y) = f Then 
			mineData(x, y) = t
			If f = "N" Then 
				If t = "F" Then 
					operate_flag x,y
				ElseIf t = "X" Then
					operate_left_click x,y
				End If
			End If
		End If
	End If
End Function
//�������ĵĲ���
Function operate_flag(x,y)
	pixelX = ox + 16 * x 
	pixelY = oy + 16 * y
	Call Plugin.Bkgnd.RightClick(MineWin, pixelX, pixelY)
End Function


Function isin_exist_list(x,y)
	item = x&"|"&y
	isin_exist_list = 0
	exist_i=0
	For exist_index
		If item = exist_list(exist_i) Then 
			isin_exist_list = 1
			Exit For
		End If
		exist_i=exist_i+1
	Next
End Function
Function add_exist_list(x, y)
	item = x & "|" & y
	u = UBound(exist_list)
	If exist_index > u Then 
		Redim Preserve exist_list(u + 10)
	End If
	exist_list(exist_index) = item
	exist_index=exist_index+1
End Function
Function remove_exist_list(x, y)
//    TracePrint "x:" & x
//    TracePrint x
//    TracePrint y
//    TracePrint "y:"&y
	item = x&"|"&y
	remove_i=0
	For exist_index
	//TracePrint "item:" & item & "   exist_list:"& exist_list(remove_i)
		If item = exist_list(remove_i) Then 
			exist_list(remove_i) = exist_list(exist_index - 1)
			exist_index = exist_index -1
			Exit For
		End If
		remove_i = remove_i+1
	Next
End Function
Function reset_exist_list()
	Redim Preserve exist_list(0)
	Redim exist_list(10)
	exist_index=0
End Function
//����Ĳ���
Function operate_left_click(x, y)
	pixelX = ox + 16 * x 
	pixelY = oy + 16 * y
	Call Plugin.Bkgnd.LeftClick(MineWin, pixelX, pixelY)
	reset_exist_list
	Call update_minedata_clamp (x,y)
End Function



Sub update_minedata_clamp(x, y)
	If x < 0 or y < 0 or x >= countX or y >= countY Then 
	ElseIf isin_exist_list(x, y) Then
	Else 
		add_exist_list x,y
		s = TileState(x, y)
		
		If s = "X" Then 
			WriteToTxt mineData, countX, countY
		End If
		
		mineData(x,y) = s
		If s = 0 Then 
			Call update_minedata_clamp (x-1, y-1)
			Call update_minedata_clamp (x  , y-1)
			Call update_minedata_clamp (x+1, y-1)
			Call update_minedata_clamp (x+1, y  )
			Call update_minedata_clamp (x+1, y+1)
			Call update_minedata_clamp (x  , y+1)
			Call update_minedata_clamp (x-1, y+1)
			Call update_minedata_clamp (x - 1, y)
		End If
	End If
End Sub


//��ʼ������
Function InitData
	For i = 0 To countY - 1
		For j = 0 To countX - 1
			mineData(i, j) = "N"
		Next
	Next
End Function

//���(x,y)����Χ8����State��ͬ������
Function get_count(x, y, state)
	result = 0
	result = result + get_state_clamp(x-1, y-1, state)
	result = result + get_state_clamp(x  , y-1, state)
	result = result + get_state_clamp(x+1, y-1, state)
	result = result + get_state_clamp(x+1, y  , state)
	result = result + get_state_clamp(x+1, y+1, state)
	result = result + get_state_clamp(x  , y+1, state)
	result = result + get_state_clamp(x-1, y+1, state)
	result = result + get_state_clamp(x - 1, y, state)
	get_count = result
End Function


//��ã�x,y����״̬�Ƿ���stateһ�£�һ�·���1����һ�·���0������xy�ĺ����ԣ�����������0
Function get_state_clamp(x, y, s)
	If x<0 or y<0 or x >=countX or y >=countY Then
		get_state_clamp = 0
	Else 
//		b = "true"
//		If not mineData(x, y)=s Then 
//			b= "false"
//		End If
//		TracePrint "(" & x & "," & y & "):" & mineData(x, y) & "," & "state:" & s & "," & b
		
		If mineData(x,y)=s Then 
			get_state_clamp = 1
		Else 
			get_state_clamp = 0
		End If
	End If
End Function



//��õ�ǰx,y���״̬
Function TileState(x, y)
	pixelX = ox + 16 * x 
	pixelY = oy + 16 * y
	//����ɫ���ж�����,[�����֣�1��2��3��4��5��6��7��8]
	numColor = Array("C0C0C0", "FF0000", "008000", "0000FF", "800000", "000080", "808000", "000000", "808080")
	GetColor = Plugin.Bkgnd.GetPixelColor(MineWin, pixelX, pixelY)
	If GetColor = "FFFFFF" Then
    	//û�㿪
    	secondColor = Plugin.Bkgnd.GetPixelColor(MineWin, pixelX + 7, pixelY + 7)
    	If secondColor = "0000FF" Then 
    		TileState = "F"
    	Else 
    		TileState = "N"
    	End If
    ElseIf Plugin.Bkgnd.GetPixelColor(MineWin, pixelX + 2, pixelY + 8) = "000000" Then
    	TileState = "X"
	Else    
    	//�Ѿ��㿪
    	TileState = "9"
    	For num = 0 To 8
    		//XY = Plugin.Bkgnd.FindCenterColor(MineWin, x, y, x + 15, y + 15, numColor(i))
    		centerColor = Plugin.Bkgnd.GetPixelColor(MineWin, pixelX+7, pixelY+7)
    		If centerColor = numColor(num) Then 
    			TileState = num
    			Exit For
    		End If
    	Next
	End If
End Function


//���Բ��ú�̨��ɫ
Function TileState01(x, y)
	pixelX = ox + 16 * x + win_x + 3
	pixelY = oy + 16 * y + win_y + 46
	//����ɫ���ж�����,[�����֣�1��2��3��4��5��6��7��8]
	numColor = Array("C0C0C0", "FF0000", "008000", "0000FF", "800000", "000080", "808000", "000000", "808080")
//	GetColor = GetPixelColor(pixelX,pixelY)
//	If GetColor = "FFFFFF" Then 
	IfColor pixelX,pixelY,"FFFFFF",0 Then
    	//û�㿪
    	//secondColor = GetPixelColor(pixelX + 7, pixelY + 7)
    	//If secondColor = "0000FF" Then 
    	IfColor pixelX + 7,pixelY + 7,"0000FF",0 Then
    		TileState01 = "F"
    	Else 
    		TileState01 = "N"
    	End If
//    ElseIf GetPixelColor(pixelX + 2, pixelY + 8) = "000000" Then
//    	TileState01 = "X"
	Else    
    	//�Ѿ��㿪
    	TileState01 = "9"
    	For num = 0 To 8
    		//XY = Plugin.Bkgnd.FindCenterColor(MineWin, x, y, x + 15, y + 15, numColor(i))
//    		centerColor = GetPixelColor(pixelX+7, pixelY+7)
//    		If centerColor = numColor(num) Then 
    		IfColor pixelX + 7,pixelY + 7,numColor(num),0 Then
    			TileState01 = num
    			Exit For
    		End If
    	Next
    	If TileState01 = 7 Then 
    		IfColor pixelX + 2, pixelY + 8, "000000", 0 Then
    			TileState01 = "X"
    		End If
    	End If
	End If
End Function


//��ʾ����״̬
Function WriteToTxt(data,x,y)
	txtHwnd = Plugin.Window.Find(0, "�½��ı��ĵ�.txt - ���±�")
	txtHwnd = Plugin.Window.FindEx(txtHwnd, 0, "Edit", 0)
	For i = 0 To y-1
		row = ""
		For j = 0 To x-1
			If data(j, i) = "0" Then 
				row = row & "  " 
			Else 
				row = row & " " & data(j,i) 
			End If
			
		Next
		Call Plugin.Window.SendString(txtHwnd, row)
		Call Plugin.Bkgnd.KeyPress(txtHwnd, 13)
	Next
End Function

//MessageBox (countX)
//TracePrint "haha"
//MessageBox((size(2) - size(0)) & "," &(size(3) - size(1))) 

//Dim a(3, 3)
//For i = 0 To 2
//	For j = 0 To 2
//		a(i,j) = i*3 +j
//	Next
//Next
//For i = 0 To 2
//	For j = 0 To 2
//		MessageBox(a(i,j))
//	Next
//Next

x = 12
y = 55

txtHwnd = Plugin.Window.Find(0, "�½��ı��ĵ�.txt - ���±�")
txtHwnd=Plugin.Window.FindEx(txtHwnd, 0, "Edit", 0)   
//MessageBox(txtHwnd)
//Call Plugin.Window.Move(txtHwnd, 100, 100)
//Delay 200
//Call Plugin.Window.SendKeyDown(txtHwnd, 70)
//Delay 200
//Call Plugin.Window.SendKeyUp(txtHwnd, 70)

//�༭txt
//aa = "jasdlfjjl"
//Call Plugin.Bkgnd.KeyPress(txtHwnd, 13)
//Call Plugin.Window.SendString(txtHwnd, aa)
//Call Plugin.Bkgnd.KeyPress(txtHwnd, 13)
//Call Plugin.Window.SendString(txtHwnd, aa)



//Hwnd = Plugin.Window.Find(0, "ɨ��")
//Delay 200
//Call Plugin.Bkgnd.MoveTo(Hwnd, 10, 100)
//Delay 100
//���
//Call Plugin.Bkgnd.LeftClick(Hwnd, x, y)
//2
//XY = Plugin.Bkgnd.FindCenterColor(Hwnd, 12, 55, 27, 70, "008000")
//1
//XY = Plugin.Bkgnd.FindCenterColor(Hwnd, 12, 55, 27, 70, "FF0000")
//3
//XY = Plugin.Bkgnd.FindCenterColor(Hwnd, 12, 71, 27, 86, "0000FF")

x = x + 2 * 16
y = y+ 1 * 16
// 4
//XY = Plugin.Bkgnd.FindCenterColor(Hwnd, x, y, x+15, y+15, "800000")
//5
//XY = Plugin.Bkgnd.FindCenterColor(Hwnd, x, y, x+15, y+15, "000080")
//7
//XY = Plugin.Bkgnd.FindCenterColor(Hwnd, x, y, x+15, y+15, "000000")
//6
//XY = Plugin.Bkgnd.FindCenterColor(Hwnd, x, y, x+15, y+15, "808000")

//8
//XY = Plugin.Bkgnd.FindCenterColor(Hwnd, x + 2, y + 2, x + 13, y + 13, "808080")

//������佫�ַ���ת������ֵ   
//X = Clng(MyArray(0)): Y = Clng(MyArray(1))   
//Msgbox "��̨������ɫX����="& X & "    Y����=" & Y 


//MessageBox(XY)