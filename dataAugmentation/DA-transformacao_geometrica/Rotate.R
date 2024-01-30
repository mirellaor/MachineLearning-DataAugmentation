rotationFilter = function(nImageRotate) {
  remove(list = ls())
  
  # Diretório da fotografia original
  setwd("C:/Users/mirel/Documents/TCC/TCC DATA AUGMENTATION/GERAÇÃO DE IMAGENS/RACHADURAA")
  
  # Importação da biblioteca EBImage
  library(EBImage)
  library(jpeg)
  
  # Lista de fotografias originais 
  photographs = list.files(pattern = ".jpg")
  
  # Aplica filtro de rotação
  # Objetivo -> gerar novas imagens (imagens artificiais)
  for (j in 1:nImageRotate) {
    for (i in 1:length(photographs)) {
      originalImage = readImage(photographs[i])
      plot(originalImage)
      
      randomValueRotate = runif(1, min = 0, max = 360)
      
      # Transformação rotate: rotação da imagem
      rotateImage = rotate(originalImage, randomValueRotate)
      
      randomValue = runif(1, min = 0, max = 1000)
      
      # ATENÇÃO: Este diretório deve estar no mesmo local das fotografias originais
      # Diretório segue este padrão: C:/Users/mirel/Documents/TCC/TCC DATA AUGMENTATION/GERAÇÃO DE IMAGENS/RACHADURAA/ImagensGeradas/rotate...
      # Salva a imagem em formato .jpg
      jpgFileName = paste("C:/Users/mirel/Documents/TCC/TCC DATA AUGMENTATION/GERAÇÃO DE IMAGENS/RACHADURAA/rotate", randomValue, photographs[i], originalImage, ".jpg")
      writeJPEG(rotateImage, target = jpgFileName)
      
      plot(rotateImage)
      dev.off()
    }
  }
  return(print("Finalizado!"))
}