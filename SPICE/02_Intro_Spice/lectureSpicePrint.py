
import re
import numpy 

def lectureSpicePrint(filename):
    f = open(filename,"r")
    lignes = f.readlines()
    k = 0
    while not re.match("-+",lignes[k]):
        print(lignes[k])
        k += 1
    k += 1
    entete =lignes[k].strip()
    champs = re.split("\s+",entete)
    print(champs)
    k += 2
    ligne = lignes[k].strip()
    valeurs = re.split("\s+",ligne)
    complexes = []
    data = {}
    j = 0
    for i in range(len(champs)):
        valeurs[i] = valeurs[i].strip()
        if valeurs[j][len(valeurs[j])-1] == ",":
            complexes.append(True)
            j += 2
            data[champs[i]] = numpy.zeros(0,numpy.complex128)
        else:
            complexes.append(False)
            j += 1
            data[champs[i]] = numpy.zeros(0,numpy.float64)
    index = 0
    while k < len(lignes):
        ligne = lignes[k].strip()
        if re.match("^[\d+]",ligne):
            valeurs = re.split("\s+",ligne)
            j = 0
            for i in range(len(champs)):
                if complexes[i]:
                    valeurs[j]= valeurs[j][:len(valeurs[2])-1]
                    valeurs[j]= valeurs[j].replace(",",".")
                    valeurs[j+1]= valeurs[j+1].replace(",",".")
                    data[champs[i]] = numpy.append(data[champs[i]],complex(float(valeurs[j]),float(valeurs[j+1])))
                    j += 2
                else:
                    valeurs[j]= valeurs[j].replace(",",".")
                    data[champs[i]] = numpy.append(data[champs[i]],float(valeurs[j]))
                    j += 1
        k += 1
    f.close()
    return data
            