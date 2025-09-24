if ! variable_global_exists("numFase"){
	global.numFase = 1
}
else{
	global.numFase++
}
faseID = global.numFase