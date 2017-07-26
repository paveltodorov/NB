func multiplyMatrices(_ firstMatrix:[[Double]],_ secondMatrix:[[Double]]) ->[[Double]]
{
  var mult:[[Double]] = [[0,0,0],[0,0,0],[0,0,0]]
   for i in 0..<firstMatrix.count
	{
    for j in 0..<secondMatrix[0].count
		{
       for k in 0..<firstMatrix[0].count
			{
				mult[i][j] += firstMatrix[i][k] * secondMatrix[k][j];
			}
		}
	}
	return mult
}

var pi:Double = 3.1415
var tbdeg:Double = -4 - 1/12
func calculate(a:Double,e:Double,ideg: Double,l2000deg:Double,
               thetadeg:Double,thetaPlusgdeg:Double,mu1:Double = 0)
{
    print("")
    var mu:Double = mu1/1000000
    var i = ideg*pi/180
    var l2000 =  l2000deg*pi/180
    var theta = thetadeg*pi/180
    var thetaPlusg = thetaPlusgdeg*pi/180
    var tb = tbdeg*pi/180
    //var mu:Double = 0
    var gama:Double = 1
    var n:Double = pow(a,-3/2)*sqrt(1 + mu)
    var g = thetaPlusg - theta 
    print("n = \(n)")
    var lambda2000 = l2000 + thetaPlusg
    //var lambda2000:Double = n*(tb - t2000) + thetaPlusg
    print("lambda2000 = \(lambda2000)")
    var t2000 = (thetaPlusg - lambda2000)/n - tb
    print("t2000 = \(t2000)")
    var lambdab = lambda2000 + n*(tb - t2000)
    print("lambdab = \(lambdab)")
    var lb:Double = -thetaPlusg + lambda2000 + n*(tb - t2000)
    print("lb = \(lb)")
    var u:Double = lb + e*sin(lb + e*sin(lb))
    print("ub = \(u)")
    var matrix1:[[Double]] = [[cos(theta),-sin(theta),0],[sin(theta),cos(theta),0],[0,0,1]]
    var matrix2:[[Double]] = [[1,0,0],[0,cos(i),-sin(i)],[0,sin(i),cos(i)]]
    var matrix4:[[Double]] = [[cos(g),-sin(g),0],[sin(g),cos(g),0],[0,0,1]]
    var matrix3:[[Double]] = multiplyMatrices(matrix1,matrix2)
    var matrix5:[[Double]] = multiplyMatrices(matrix3,matrix4)
    var matrixhelp = 1/(sqrt(a)*(1 - e)*cos(u))
    var matrix6:[[Double]] = [[-sin(u)*matrixhelp,a*cos(u)-e],
                              [sqrt(1-e*e)*cos(u)*matrixhelp,a*sqrt(1-e*e)*sin(u)],
                              [0,0]]
    var matrix7 = multiplyMatrices(matrix5,matrix6)
    print("x = \(matrix7[0][1])")
    print("y = \(matrix7[1][1])")
    print("z = \(matrix7[2][1])")
    print("x' = \(matrix7[0][0])")
    print("y' = \(matrix7[1][0])")
    print("z' = \(matrix7[2][0])")
    //var m = 0.000
    var L:Double = mu*sqrt(gama*a)
    print("L = \(L)")
    var G:Double = mu*sqrt(gama*a)*sqrt(1 - e*e)
    print("G = \(G)")
    var Theta:Double = mu*sqrt(gama*a)*sqrt(1 - e*e)*cos(i)
    print("Theta = \(Theta)")
    var ksi = sqrt(2*(L-G))*cos(g + theta)
    print("ksi = \(ksi)")
    var eta = -sqrt(2*(L-G))*sin(g + theta)
    print("eta = \(eta)")
    var p = sqrt(2*(G - Theta))*cos(theta)
    print("p = \(p)")
    var q = -sqrt(2*(G - Theta))*sin(theta)
    print("q = \(q)")
}               
  calculate(a:0.38709927, e:0.20563593,ideg:7.00497902, l2000deg:252.25032350, thetadeg: 48.33076593, thetaPlusgdeg:77.45779628 ,mu1:0.16601)
//calculate(a:0.72333566, e:0.00677672,ideg:3.39467605, l2000deg:181.97909950, thetadeg:76.67984255,  thetaPlusgdeg:131.60246718,mu1:2.4478383)
//calculate(a:1.00000261, e:0.01671123,ideg:-0.00001531,l2000deg:100.46457166, thetadeg: 0.00,        thetaPlusgdeg:102.93768193,mu1:3.04043263333)
//calculate(a:1.52371034, e:0.09339410,ideg:1.84969142, l2000deg:-4.55343205,  thetadeg:  49.55953891,thetaPlusgdeg:-23.94362959,mu1:0.3227151)
//calculate(a:5.20288700, e:0.04838624,ideg:1.30439695, l2000deg:34.39644051,  thetadeg: 100.47390909,thetaPlusgdeg:14.72847983, mu1:954.79194)
//calculate(a:9.53667594, e:0.05386179,ideg:2.48599187, l2000deg:49.95424423,  thetadeg: 113.66242448,thetaPlusgdeg:92.59887831, mu1:285.8860)
//calculate(a:19.18916464,e:0.04725744,ideg:0.77263783, l2000deg:313.23810451, thetadeg: 74.01692503, thetaPlusgdeg:170.95427630,mu1:43.66244)
//calculate(a:30.06992276,e:0.00859048,ideg:1.77004347, l2000deg:-55.12002969, thetadeg: 131.78422574,thetaPlusgdeg:44.96476227, mu1:51.51389)
