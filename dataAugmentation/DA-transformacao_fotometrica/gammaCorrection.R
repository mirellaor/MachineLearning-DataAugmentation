gammaCorrectionFilter = function(nImageGammaCorrection) {
  remove(list=ls())
  
  # Diretório da fotografia original
  setwd("C:/Users/mirel/Documents/TCC/GERACAO DE IMAGENS")
  
  # Importação da biblioteca EBImage
  library(EBImage)
  library(jpeg)
  
  # Lista de fotografias originais 
  # ATENÇÃO: A fotografia deve estar no formato indicado, nesse exemplo ".png"
  photographs = list.files(pattern = ".jpg")
  
  # Aplica filtro de Correcao Gamma
  # Objetivo -> gerar novas imagens (imagens artificiais)
  for (j in 1:nImageGammaCorrection) {
    for (i in 1:length(photographs)) {
      originalImage = readImage(photographs[i])
      
      randomGammaValue = runif(1, min = 0, max = 1)
      
      # Transformacao: Correcao Gamma
      gammaCorrectionImage = originalImage^randomGammaValue
      
      randomValue = runif(1, min = 0, max = 1000)
      
      # ATENÇÃO: Este diretório deve estar no mesmo local das fotografias originais
      # Diretório segue este padrão: C:/Users/mirel/Documents/TCC/TCC DATA AUGMENTATION/GERAÇÃO DE IMAGENS/CORREÇÃO GAMMA/gamma...
      jpgFileName = paste("C:/Users/mirel/Documents/TCC/GERACAO DE IMAGENS/gamma", randomValue, photographs[i], originalImage, ".jpg")
      
      writeJPEG(gammaCorrectionImage, target = jpgFileName) # Salva a imagem em formato JPG
      
      plot(gammaCorrectionImage)
      dev.off()
    }
  }
  return(print("Finalizado!"))
}