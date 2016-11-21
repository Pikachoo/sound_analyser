# README

Program draw graphic and amplitude spectrum of discrete signal.

You need file with .txt extension, where will be listed files with .bin extension.
File with .bin extension contains discrete signal data.


###Structure of .bin file:
| Name     | Size    | Type |
| --------|---------|-------|
| file signature  | 4   | int    |
| number of canals | 4 | int    |
3.size of block - 4 bytes(int)
*number of spectral lines - 4 bytes(int)
*frequency - 4 bytes(int)
*frequency extension - 4 bytes(float)
*time of block - 4 bytes(float) seconds
*total time - 4 bytes(int) seconds
*number of blocks by user - 4 bytes(int)
*number of discrete points - 4 bytes(int)
*number of blocks by system - 4 bytes(int)
*max value - 4 bytes(float)
*min value - 4 bytes(float)
*Further, points by 4 bytes(float)
