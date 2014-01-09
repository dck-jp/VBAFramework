Attribute VB_Name = "Sample"
Option Explicit

Sub SampleCode()
    ' �ȉ��A���\�b�h�Ăяo������ Call ��t���Ă���̂́A
    ' C#���ۂ������� () �ł������ēn����������

    ' VBA_Stopwatch �̃T���v�� ____________________
    Dim sw As New VBA_Stopwatch
    sw.Start
    
    ' VBA_Clipboard �̃T���v�� ____________________
    Dim testString As String: testString = "test"
    Call Clipborad.SetText(testString)
    
    ' VBA_File �̃T���v�� ____________________
    Dim fileName As String: fileName = "hoge.txt"
    Call File.WriteAllText(fileName, testString)
    testString = File.ReadAllText(fileName)
    Call File.Delete(fileName)
    
    ' VBA_ConfigFile �̃T���v�� ____________________
    Dim temp() As String: ReDim temp(2)
    temp(0) = "parameter1": temp(1) = "parameter2"
    
    Dim config As New VBA_ConfigFile
    config.ConfigFileName = "test.config" '�t�@�C�����̎w��K�{
    Call config.WriteConfigFile(temp)
    temp = config.ReadConfigFile()
    
    ' VBA_File, VBA_Directory, VBA_Path �̃T���v�� ____________________
    Call File.Delete(config.ConfigFilePath)
    Call Directory.Delete(IOPath.GetDirectoryName(config.ConfigFilePath))
    
    ' VBA_StringBuiler �̃T���v�� ____________________________
    Dim sb As New VBA_StringBuilder
    Dim i: For i = 0 To 1000
        Call sb.Append(testString)
    Next
    testString = sb.ToString()
        
    ' VBA_VAMIE �̃T���v�� ____________________________
    Dim ie As New VBA_VAMIE
    Call ie.goto_url("http://www.google.co.jp")
    Call ie.type_val("q", "�ق���")
    Call ie.submit_click("btnG")
    Call ie.waitIE
    MsgBox ie.domselec(Array("id", "rso", _
                            "tag", "li", 0, _
                            "tag", "h3", 0 _
                        )).innerText
    Call ie.Quit
    
    sw.Stop_
    Call MsgBox("ElapsedTime : " & sw.ElapsedMilliseconds & "msec")
End Sub
