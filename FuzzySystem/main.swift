//
//  main.swift
//  FuzzySystem
//
//  Created by Abdullah Ayan on 15.05.2022.
//

import Foundation

var T1 = [Double]()
var T2 = [Double]()
var T3 = [Double]()

var P1 = [Double]()
var P2 = [Double]()
var P3 = [Double]()

var T = [T1,T2,T3]
var P = [P1,P2,P3]

for i in 0...2{
    for _ in 0...9{
        var d = Double.random(in: 7...16)
        d = round(100*d)/100
        T[i].append(d)
    }
}

for i in 0...2{
    for _ in 0...9{
        var d = Double.random(in: 1.75...4.00)
        d = round(100*d)/100
        P[i].append(d)    }
}




func pressure(x : Double) -> [Double]{
    
    var VB = 0.0 ,B = 0.0 ,N = 0.0 ,G = 0.0, VG = 0.0
    
    if x == 1.75{
        VB = 1}
    
    if x>1.75 && x<2.25{
        VB = (-1*((x-2.25)/(2.25-1.75)))
        B = ((x-1.75)/(2.25-1.75))}
    
    if x == 2.25{
        B = 1}
    
    if x > 2.25 && x < 2.5 {
        B = (-1*((x-2.5)/(2.5-2.25)))
        N = ((x-2.25)/(2.75-2.25))}
    
    if x == 2.5{
        N = ((x-2.25)/(2.75-2.25))}
    
    if x > 2.5 && x <= 2.75{
        N = ((x-2.25)/(2.75-2.25))
        G = ((x-2.50)/(3.25-2.5))}
    
    if x == 2.75{
        N = 1
        G = ((x-2.50)/(3.25-2.5))}
    
    if x>2.75 && x<3.25{
        G = (x-2.5)/(3.25-2.5)
        VG = (x-2.75)/(4-2.75)
        N = (-1*((x-3.25)/(3.25-2.75)))}
    
    if x == 3.25{
        G = 1
        VG = (3.25-2.75)/(4-2.75)}
    
    if x > 3.25 && x < 3.5{
        VG = (x-2.75)*(4-2.75)
        G = (-1*(x-3.5)/(3.5-3.25))}
    
    if x >= 3.5 && x<4{
        VG = (x-2.75)/1.25}
    
    if x == 4 {
        VG = 1}
    
    return  [VB,B,N,G,VG]
    
    
}

func tempeture(x : Double) -> [Double] {
    var VC = 0.0 , C = 0.0 , N = 0.0 ,H = 0.0, VH = 0.0
    
    if x == 7{
        VC = 1}
    
    if x > 7 && x < 9{
        VC   = (-1*(x-9)/(9-7))
        C = ((x-7)/(9-7))}
    
    if x == 9{
        C=1}
    
    if x > 9 && x <= 10{
        C = (-1*(x-11)/(11-9))}
    
    if x > 10 && x <= 11{
        C = (-1*(x-11)/(11-9))
        N = ((x-10)/(12-10))}
    
    if x > 11 && x < 12{
        N = ((x-11)/(12-10))}
    
    if x == 12{
        N = 1}
    
    if x > 12 && x <= 13{
        N = (-1*(x-14)/(14-12))
        H = ((x-12)/(14-12))}
    
    if  x > 13 && x < 14{
        N = (-1*(x-14)/(14-12))
        H = ((x-12)/(14-12))
        VH = ((x-13)/(16-13))}
    
    if  x == 14 {
        H = 1
        VH = ((x-12)/(16-13))}
    
    if x > 14 && x < 16{
        H = (-1*(x-16)/(16-14))
        VH = ((x-13)/(16-13))}
    
    if x == 16 {
        VH = 1}
    
    return  [VC,C,N,H,VH]
}


func inference(temp: [Double],pressure : [Double]) -> [Double]{
    
    var VB = [0.0]
    var B = [0.0,0.0,0.0,0.0,0.0]
    var N = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    var G = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    var VG = [0.0,0.0,0.0,0.0]
    var result = [0.0,0.0,0.0,0.0,0.0]
    
    
    if pressure[0] != 0.0 && temp[0] != 0.0 {
        N[0] = min(pressure[0],temp[0])}
    if pressure[0] != 0 && temp[1] != 0{
        B[0] = min(pressure[0],temp[1])}
    if pressure[0] != 0 && temp[2] != 0{
        B[1] = min(pressure[0],temp[2])}
    if pressure[0] != 0 && temp[3] != 0{
        B[2] = min(pressure[0],temp[3])}
    if pressure[0] != 0 && temp[4] != 0{
        VB[0] = min(pressure[0],temp[3])}
    if pressure[1] != 0 && temp[0] != 0{
        N[1] = min(pressure[1],temp[0])}
    if pressure[1] != 0 && temp[1] != 0{
        G[0] = min(pressure[1],temp[1])}
    if pressure[1] != 0 && temp[2] != 0{
        N[2] = min(pressure[1],temp[2])}
    if pressure[1] != 0 && temp[3] != 0{
        B[3] = min(pressure[1],temp[3])}
    if pressure[1] != 0 && temp[4] != 0{
        B[4] = min(pressure[1],temp[4])}
    if pressure[2] != 0 && temp[0] != 0{
        G[1]=min(pressure[2],temp[0])}
    if pressure[2] != 0 && temp[1] != 0{
        G[2] = min(pressure[2],temp[1])}
    if pressure[2] != 0 && temp[2] != 0{
        N[3] = min(pressure[2],temp[2])}
    if pressure[2] != 0 && temp[3] != 0{
        N[4] = min(pressure[2],temp[3])}
    if pressure[2] != 0 && temp[4] != 0{
        N[5] = min (pressure[2],temp[4])}
    if pressure[3] != 0 && temp[0] != 0 {
        VG[0] = min(pressure[3],temp[0])}
    if pressure[3] != 0 && temp[1] != 0 {
        G[3] = min(pressure[3],temp[1])}
    if pressure[3] != 0 && temp[2] != 0{
        G[4] = min(pressure[3],temp[2])}
    if pressure[3] != 0 && temp[3] != 0{
        N[6] = min(pressure[3],temp[3])}
    if pressure[3] != 0 && temp[4] != 0{
        N[7] = min(pressure[3],temp[4])}
    if pressure[4] != 0 && temp[0] != 0{
        VG[1] = min(pressure[4],temp[0])}
    if pressure[4] != 0 && temp[1] != 0{
        VG[2] = min(pressure[4],temp[1])}
    if pressure[4] != 0 && temp[2] != 0{
        VG[3] = min(pressure[4],temp[2])}
    if pressure[4] != 0 && temp[3] != 0{
        G[5] = min(pressure[4],temp[3])}
    if pressure[4] != 0 && temp[4] != 0{
        G[6] = min(pressure[4],temp[4])}

    
    result[0] = VB[0]
    result[1] = max(B[0],B[1],B[2],B[3],B[4])
    result[2] = max(N[0],N[1],N[2],N[3],N[4],N[5],N[6],N[7])
    result[3] = max(G[0],G[1],G[2],G[3],G[4],G[5],G[6])
    result[4] = max(VG[0],VG[1],VG[2],VG[3])
    return [result[0],result[1],result[2],result[3],result[4]]
    
}

func defuzzification(result : [Double]) -> Double {
    var i = 0.0
    var total = 0.0
    
    if result[0] != 0 && result[0] != 1 {
        total += result[0]*(3-result[0])/(result[0])
        i += 1}
    
    if result[1] != 0 && result[1] != 1 {
        total += (result[1]*(2+result[1]))+(result[1]*(4-result[1]))/(2*result[1])
        i += 1}
    
    if result[2] != 0 && result[2] != 1 {
        total+=(result[2]*(3+result[2]))+(result[2]*(5-result[2]))/(2*result[2])
        i += 1}
    
    
    if result[3] != 0 && result[3] != 1 {
        total += (result[3]*(4+result[3]))+(result[3]*(6-result[3]))/(2*result[3])
        i += 1}
    
    if result[4] != 0 && result[4] != 1 {
        total += result[4]*(5+result[4])/(result[4])
        i += 1}
    
    if  result[0]==1 {
        total+=2
        i += 1}
    
    if  result[1]==1 {
        total+=3
        i += 1}
    
    if  result[2]==1 {
        total+=4
        i += 1}
    
    if  result[3]==1 {
        total+=5
        i += 1}
    
    if  result[4]==1 {
        total+=6
        i += 1}
    
    if i == 0 {
        return 0}
    
    return (total/i)
}



func FLS(_ T : [Double],_ P : [Double]){
    var i = 0
    while i < P.count{
        var result = defuzzification(result: inference(temp: tempeture(x: T[i]), pressure: pressure(x: P[i])))
        result = round(100*result)/100
        if result > 6 {
            result = 6
        }
        print("If Degree == \(T[i])    and Pressure == \(P[i])    Then Result == \(result) ")
        i += 1
    }
    print("\n\n")
}

print("T1 : \(T[0])\nP1 : \(P[0])\n\nT2 : \(T[1])\nP2 : \(P[2])\n\nT1 : \(T[2])\nP3 : \(P[2])\n\n")

FLS(T[0],P[0])
FLS(T[1],P[1])
FLS(T[2],P[2])
