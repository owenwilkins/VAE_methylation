######################
# Correlated CpG analysis
#
# Author: Alexander Titus
# Created: 03/21/2018
# Updated: 03/21/2018
######################

#####################
# Set up the environment
#####################
     require(data.table)
     require(limma)
     require(scales)
######################
## Set WD
# Change this to your base WD, and all other code is relative to the folder structure
     #base.dir = 'C:/Users/atitus/github/VAE_methylation'
     base.dir = '/Users/alexandertitus/Documents/github/VAE_methylation/'
     setwd(base.dir)

     
#####################
# ggplot theme
#####################   
     theme_Publication <- function(base_size=14) {
          library(grid)
          library(ggthemes)
          (theme_foundation(base_size=base_size)
               + theme(plot.title = element_text(face = "bold",
                                                 size = rel(1.2), hjust = 0.5),
                       text = element_text(),
                       panel.background = element_rect(colour = NA),
                       plot.background = element_rect(colour = NA),
                       panel.border = element_rect(colour = NA),
                       axis.title = element_text(face = "bold",size = rel(1)),
                       axis.title.y = element_text(angle=90,vjust =2),
                       axis.title.x = element_text(vjust = -0.2),
                       axis.text = element_text(), 
                       axis.line = element_line(colour="black"),
                       axis.ticks = element_line(),
                       panel.grid.major = element_line(colour="#f0f0f0"),
                       panel.grid.minor = element_blank(),
                       legend.key = element_rect(colour = NA),
                       legend.position = "bottom",
                       legend.direction = "horizontal",
                       legend.key.size= unit(0.2, "cm"),
                       legend.margin = unit(0, "cm"),
                       legend.title = element_text(face="italic"),
                       plot.margin=unit(c(10,5,5,5),"mm"),
                       strip.background=element_rect(colour="#f0f0f0",fill="#f0f0f0"),
                       strip.text = element_text(face="bold")
               ))
          
     }
     
     scale_fill_Publication <- function(...){
          library(scales)
          discrete_scale("fill","Publication",manual_pal(values = c("#386cb0","#fdb462","#7fc97f","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)
          
     }
     
     scale_colour_Publication <- function(...){
          library(scales)
          discrete_scale("colour","Publication",manual_pal(values = c("#386cb0","#fdb462","#7fc97f","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)
          
     }   
     
     
######################
## Read in the CpG data
     base = 'results/100D/Thresholds_various/'
     node22 = read.csv(paste(base, 'anno450K_node22.csv', sep = ''))
     node22$node = 22
     table(node22$Relation_to_Island)
     table(node22$Relation_to_Island, node22$Enhancer)

     node24 = read.csv(paste(base, 'anno450K_node24.csv', sep = ''))
     node24$node = 24
     table(node24$Relation_to_Island)
     table(node24$Relation_to_Island, node24$Enhancer)

     node35 = read.csv(paste(base, 'anno450K_node35.csv', sep = ''))
     node35$node = 35
     table(node35$Relation_to_Island)
     table(node35$Relation_to_Island, node35$Enhancer)
     
     node43 = read.csv(paste(base, 'anno450K_node43.csv', sep = ''))
     node43$node = 43
     table(node43$Relation_to_Island)
     table(node43$Relation_to_Island, node43$Enhancer)
     
     node63 = read.csv(paste(base, 'anno450K_node63.csv', sep = ''))
     node63$node = 63
     table(node63$Relation_to_Island)
     table(node63$Relation_to_Island, node63$Enhancer)
     
     node91 = read.csv(paste(base, 'anno450K_node91.csv', sep = ''))
     node91$node = 91
     table(node91$Relation_to_Island)
     table(node91$Relation_to_Island, node91$Enhancer)
     
     node93 = read.csv(paste(base, 'anno450K_node93.csv', sep = ''))
     node93$node = 93
     table(node93$Relation_to_Island)
     table(node93$Relation_to_Island, node93$Enhancer)
     
     full.data = rbind(node22, node24, node35, node43, node63, node91, node93)


## Plot CpGs by island context
     library(scales)
     library(gridExtra)
     
     n22 = ggplot(node22, aes(x = Relation_to_Island)) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE Dimension 22") +
          xlab("Context") + ylab("Proportion of associated CpGs per island context") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     n24 = ggplot(node24, aes(x = Relation_to_Island)) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE Dimension 24") +
          xlab("Context") + ylab("Proportion of associated CpGs per island context") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     n35 = ggplot(node35, aes(x = Relation_to_Island)) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE Dimension 35") +
          xlab("Context") + ylab("Proportion of associated CpGs per island context") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     n37 = ggplot(node37, aes(x = Relation_to_Island)) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE Dimension 37") +
          xlab("Context") + ylab("Proportion of associated CpGs per island context") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     n43 = ggplot(node43, aes(x = Relation_to_Island)) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE Dimension 43") +
          xlab("Context") + ylab("Proportion of associated CpGs per island context") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     n63 = ggplot(node63, aes(x = Relation_to_Island)) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE Dimension 63") +
          xlab("Context") + ylab("Proportion of associated CpGs per island context") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     n91 = ggplot(node91, aes(x = Relation_to_Island)) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE Dimension 91") +
          xlab("Context") + ylab("Proportion of associated CpGs per island context") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     n93 = ggplot(node93, aes(x = Relation_to_Island)) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE Dimension 93") +
          xlab("Context") + ylab("Proportion of associated CpGs per island context") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

     nFull = ggplot(full.data, aes(x = Relation_to_Island)) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("All VAE Dimensions") +
          xlab("Context") + ylab("Proportion of associated CpGs per island context") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
     
     lay <- rbind(c(1,2,3),
                  c(4,5,8),
                  c(6,7,8))
     
     g = grid.arrange(n24, n35, n43,
                      n91, n93,  
                      n22, n63, nFull, ncol = 3,
                      layout_matrix = lay)
     
     ggsave(g, file="results/nodeCpG_correllation_relationToisland.png", width=16, height=16)


## Plot CpGs by chromosome
     #node22$chr = node22$chr.x
     names1 = as.numeric(substr(node22$chr, 4, 100))
     n22 = ggplot(node22, aes(x = reorder(chr, names1))) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE dimension 22") +
          xlab("Chromosome") + ylab("Proportion of associated CpGs per chromosome") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     #node24$chr = node24$chr.x
     names2 = as.numeric(substr(node24$chr, 4, 100))
     n24 = ggplot(node24, aes(x = reorder(chr, names2))) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE dimension 24") +
          xlab("Chromosome") + ylab("Proportion of associated CpGs per chromosome") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     #node35$chr = node35$chr.x
     names86 = as.numeric(substr(node35$chr, 4, 100))
     n35 = ggplot(node35, aes(x = reorder(chr, names86))) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE dimension 35") +
          xlab("Chromosome") + ylab("Proportion of associated CpGs per chromosome") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     #node37$chr = node37$chr.x
     names28 = as.numeric(substr(node37$chr, 4, 100))
     n37 = ggplot(node37, aes(x = reorder(chr, names28))) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE dimension 37") +
          xlab("Chromosome") + ylab("Proportion of associated CpGs per chromosome") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     #node43$chr = node43$chr.x
     names33 = as.numeric(substr(node43$chr, 4, 100))
     n43 = ggplot(node43, aes(x = reorder(chr, names33))) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE dimension 43") +
          xlab("Chromosome") + ylab("Proportion of associated CpGs per chromosome") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     
     #node63$chr = node63$chr.x
     names63 = as.numeric(substr(node63$chr, 4, 100))
     n63 = ggplot(node63, aes(x = reorder(chr, names63))) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE dimension 63") +
          xlab("Chromosome") + ylab("Proportion of associated CpGs per chromosome") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     #node91$chr = node91$chr.x
     names91 = as.numeric(substr(node91$chr, 4, 100))
     n91 = ggplot(node91, aes(x = reorder(chr, names91))) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE dimension 91") +
          xlab("Chromosome") + ylab("Proportion of associated CpGs per chromosome") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     #node93$chr = node93$chr.x
     names93 = as.numeric(substr(node93$chr, 4, 100))
     n93 = ggplot(node93, aes(x = reorder(chr, names93))) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("VAE dimension 93") +
          xlab("Chromosome") + ylab("Proportion of associated CpGs per chromosome") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     namesFull = as.numeric(substr(full.data$chr, 4, 100))
     nFull = ggplot(full.data, aes(x = reorder(chr, namesFull))) + geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + ggtitle("All VAE dimensions") +
          xlab("Chromosome") + ylab("Proportion of associated CpGs per chromosome") + theme_Publication() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
     
     
     lay <- rbind(c(1,2,3),
                  c(4,5,8),
                  c(6,7,8))
     
     g = grid.arrange(n24, n35, n43,
                      n91, n93,  
                      n22, n63, nFull, ncol = 3,
                      layout_matrix = lay)
     
     ggsave(g, file="results/nodeCpG_correllation_chr.png", width=16, height=16)

     
#####################
# Proportion of sites annotated to gene
##################### 
     full.data$node = as.character(full.data$node)
     full.data$GeneAnnot = ifelse(full.data$UCSC_RefGene_Name == '', 'Not Annotated to Gene', 'Annotated to Gene')
     table(full.data$GeneAnnot, full.data$node)
     
     # need to complete!
     nFull = ggplot(full.data, aes(x = node, fill = GeneAnnot)) + 
          geom_bar(aes(y=..count../sum(..count..))) +
          scale_y_continuous(labels=percent_format()) + 
          ggtitle("All VAE dimensions") +
          xlab("VAE Dimension") + 
          ylab("Proportion of associated CpGs") + 
          theme_Publication() +
          theme(axis.text.x = element_text(angle = 0, hjust = 0.5)); nFull
     
     file.name = paste0("results/nodeCpG_gene_annotation.png")
     png(file.name, width = 3000, height = 3000, res = 300)
     nFull
     dev.off()

     
#####################
# Correlation plots between methylation and activations
#####################  

     plot.cor = function(cors.use, node, annotLedgend){
          temp.cpg = as.character(cors.use[abs(cors.use$correlations) == max(abs(cors.use$correlations)), ]$CpG)
          
          vae = vae[order(rownames(vae)), ]
          betas = betas[order(rownames(betas)), ]
          covs.updated = covs.updated[order(covs.updated$Basename), ]
          all(rownames(betas) == rownames(vae))
          all(rownames(betas) == covs.updated$Basename)
          
          node.name = paste0('VAE', node)
          temp = data.frame(cbind(node.name = vae[[node]], 
                                  'Betas' = betas[[temp.cpg]],
                                  'ER' = covs.updated$ER))
          temp$node.name = as.numeric(as.character(temp$node.name))
          temp$Betas = as.numeric(as.character(temp$Betas))
          temp$ER = ifelse(temp$ER == '', 'Unknown', 
                           ifelse(temp$ER == 'Positive', 'Positive', 'Negative'))
          
          
          temp = temp[temp$ER != 'Unknown', ]
          g = ggplot(temp, aes(x=node.name, y=Betas)) +
               geom_point(size=2, aes(col = ER)) + 
               geom_smooth(method='lm') +
               ylim(0, 1) + 
               ggtitle(paste0("VAE", node)) +
               xlab(paste0('VAE', node, ' Activation')) + 
               ylab(paste0(temp.cpg, ' Beta Value')) + 
               theme(legend.position=annotLedgend) +
               annotate("text", x = 2, y = 0.0, label = paste0("Cor = ", format(round((cor(temp$node.name, temp$Betas)), 2), nsmall = 2))) +
               theme_Publication()
          return(g)
     }
     
    
     
     png(filename = 'results/correlations24.png', width = 1200, height = 1200, res = 300)
     n24 = plot.cor(correlations24, 24, annotLedgend = 'none'); n24
     dev.off()
     
     png(filename = 'results/correlations35.png', width = 1200, height = 1200, res = 300)
     n35 = plot.cor(correlations35, 35, annotLedgend = 'none'); n35
     dev.off()
     
     png(filename = 'results/correlations43.png', width = 1200, height = 1200, res = 300)
     n43 = plot.cor(correlations43, 43, annotLedgend = 'none'); n43
     dev.off()
     
     png(filename = 'results/correlations91.png', width = 1200, height = 1200, res = 300)
     n91 = plot.cor(correlations91, 91, annotLedgend = 'none'); n91
     dev.off()
     
     png(filename = 'results/correlations93.png', width = 1200, height = 1200, res = 300)
     n93 = plot.cor(correlations93, 93, annotLedgend = 'none'); n93
     dev.off()
     
     png(filename = 'results/correlations22.png', width = 1200, height = 1200, res = 300)
     n22 = plot.cor(correlations22, 22, annotLedgend = 'bottom'); n22
     dev.off()
     
     png(filename = 'results/correlations63.png', width = 1200, height = 1200, res = 300)
     n63 = plot.cor(correlations63, 63, annotLedgend = 'none'); n63
     dev.off()
     
     
     lay <- rbind(c(1,2,3),
                  c(4,5),
                  c(6,7))
     
     # nFull from right above
     g = grid.arrange(n24, n35, n43,
                      n91, n93,  
                      n22, n63, nrow = 3,
                      layout_matrix = lay)
     
     ggsave(g, file="results/nodeCpG_correllations.png", width=16, height=16)
     
     
#####################
# Analyzing high correlation CpGs
#####################  
     er.neg = rbind(correlations24, correlations35, correlations43)
     er.neg = er.neg[order(er.neg$correlations, decreasing = T), ]
     temp = er.neg[abs(er.neg$correlations) > 0.7, ]
     View(ann450k[ann450k$Name %in% temp$CpG, ])
     
     er.pos = rbind(correlations91, correlations93)
     er.pos = er.pos[order(er.pos$correlations, decreasing = T), ]
     temp = er.pos[abs(er.pos$correlations) > 0.65, ]
     View(ann450k[ann450k$Name %in% temp$CpG, ])
     
     er.all = rbind(correlations22, correlations63)
     er.all = er.all[order(er.all$correlations, decreasing = T), ]
     temp = er.all[abs(er.all$correlations) > 0.7, ]
     View(ann450k[ann450k$Name %in% temp$CpG, ])
     