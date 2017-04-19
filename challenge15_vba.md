

```
' MODULE PURPOSE: Find number of lattice paths in 20x20 grid

' This sub runs the function below.  Only one function created for this project
' First argument provided to function is number of rows, second is number of columns in grid
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
    
    'Loop to create 2d array
    'First two rows are known and provided.  They consist of 11111...x20 and 1....20
    'First column in each row is known and is 1
    'Remaining row/column data derived as this row index - 1 + last row this index.
    
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
