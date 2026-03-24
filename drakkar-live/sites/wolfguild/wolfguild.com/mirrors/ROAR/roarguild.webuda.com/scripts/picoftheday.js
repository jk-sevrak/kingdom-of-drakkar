var theImages = new Array()

theImages[0] = 'Actionshots/Actionshot001.jpg'
theImages[1] = 'Actionshots/Actionshot002.jpg'
theImages[2] = 'Actionshots/Actionshot003.jpg'
theImages[3] = 'Actionshots/Actionshot004.jpg'
theImages[4] = 'Actionshots/Actionshot005.jpg'
theImages[5] = 'Actionshots/Actionshot006.jpg'
theImages[6] = 'Actionshots/Actionshot007.jpg'
theImages[7] = 'Actionshots/Actionshot008.jpg'
theImages[8] = 'Actionshots/Actionshot009.jpg'
theImages[9] = 'Actionshots/Actionshot010.jpg'
theImages[10] = 'Actionshots/Actionshot011.jpg'
theImages[11] = 'Actionshots/Actionshot012.jpg'
theImages[12] = 'Actionshots/Actionshot013.jpg'
theImages[13] = 'Actionshots/Actionshot014.jpg'
theImages[14] = 'Actionshots/Actionshot015.jpg'
theImages[15] = 'Actionshots/Actionshot016.jpg'
theImages[16] = 'Actionshots/Actionshot017.jpg'
theImages[17] = 'Actionshots/Actionshot018.jpg'
theImages[18] = 'Actionshots/Actionshot019.jpg'
theImages[19] = 'Actionshots/Actionshot020.jpg'
theImages[20] = 'Actionshots/Actionshot021.jpg'
theImages[21] = 'Actionshots/Actionshot022.jpg'
theImages[22] = 'Actionshots/Actionshot023.jpg'
theImages[23] = 'Actionshots/Actionshot024.jpg'
theImages[24] = 'Actionshots/Actionshot025.jpg'
theImages[25] = 'Actionshots/Actionshot026.jpg'
theImages[26] = 'Actionshots/Actionshot027.jpg'
theImages[27] = 'Actionshots/Actionshot028.jpg'
theImages[28] = 'Actionshots/Actionshot029.jpg'
theImages[29] = 'Actionshots/Actionshot030.jpg'
theImages[30] = 'Actionshots/Actionshot031.jpg'
theImages[31] = 'Actionshots/Actionshot032.jpg'
theImages[32] = 'Actionshots/Actionshot033.jpg'
theImages[33] = 'Actionshots/Actionshot034.jpg'
theImages[34] = 'Actionshots/Actionshot035.jpg'
theImages[35] = 'Actionshots/Actionshot036.jpg'
theImages[36] = 'Actionshots/Actionshot037.jpg'
theImages[37] = 'Actionshots/Actionshot038.jpg'
theImages[38] = 'Actionshots/Actionshot039.jpg'

var j = 0
var p = theImages.length;

var preBuffer = new Array()
for (i = 0; i < p; i++){
   preBuffer[i] = new Image()
   preBuffer[i].src = theImages[i]
}

var whichImage = Math.round(Math.random()*(p-1));
function showImage(){
document.write('<img src="'+theImages[whichImage]+'">');
}