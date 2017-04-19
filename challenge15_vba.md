

```
' MODULE PURPOSE: Find number of lattice paths in 20x20 grid

' This sub runs the function below.  Only one function created for this project
Sub letsrun()
Number = find_lattice(20, 20)
Debug.Print (Number)
End Sub

' Function will create 2d array, return last number in array
Public Function find_lattice(numrows As Integer, numcols As Integer) As Double
    Dim masterarray() As Double
    Dim colctr As Long
    Dim rowctr As Long


    colctr = 0
    rowctr = 0
    
    ReDim masterarray(numrows, numcols) As Double
    
    Do While rowctr < numrows
    
        Do While colctr < numcols
            If rowctr = 0 Then
                masterarray(rowctr, colctr) = 1
            ElseIf rowctr = 1 Then
                masterarray(rowctr, colctr) = colctr + 1
            Else
                If colctr = 0 Then
                    masterarray(rowctr, colctr) = 1
                Else
                    masterarray(rowctr, colctr) = masterarray(rowctr, (colctr - 1)) + masterarray((rowctr - 1), colctr)
                End If
            End If
            colctr = colctr + 1
        Loop
        colctr = 0
        rowctr = rowctr + 1
    Loop
    
    find_lattice = masterarray(numrows, numcols)

End Function
```
