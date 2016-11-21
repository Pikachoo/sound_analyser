# README

Program draw graphic and amplitude spectrum of discrete signal.

You need file with **.txt** extension, where will be listed files with **.bin** extension.
File with .bin extension contains discrete signal data.


###Structure of .bin file:
| Name     | Size    | Type |
| --------|---------|-------|
| file signature  | 4 | text |
| number of canals | 4 | int |
| size of block  | 4 | int |
| number of spectral lines | 4 | int |
| frequency  | 4 | int |
| frequency extension | 4 | float |
| time of block  | 4 | float |
| total time | 4 | int |
| number of blocks by user | 4 | int |
| number of discrete points  | 4 | int |
| number of blocks by system   | 4 | int |
| max value  | 4 | float |
| min value  | 4 | float |
| Further, points | 4 * (number of discrete points) | float |

