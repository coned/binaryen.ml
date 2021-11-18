// Attach binaryen to our global
var global = global || windows;
var G = global;
import * as binaryenjs from 'binaryen.js';
G.binaryen = binaryenjs;
