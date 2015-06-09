class Quaternion {
  float W, X, Y, Z;

  Quaternion() {
    W = 1.0;
    X = Y = Z = 0.0;
  }

  Quaternion(float w, float x, float y, float z) {
    W = w;
    X = x;
    Y = y;
    Z = z;
  }

  Quaternion mult(Quaternion q) {
    float x = q.W * X + q.X * W + q.Y * Z - q.Z * Y;
    float y = q.W * Y - q.X * Z + q.Y * W + q.Z * X;
    float z = q.W * Z + q.X * Y - q.Y * X + q.Z * W;
    float w = q.W * W - q.X * X - q.Y * Y - q.Z * Z;
    W = w;
    X = x;
    Y = y;
    Z = z;
    return this;
  }

  Quaternion normalize() {
    float norme = sqrt(W*W + X*X + Y*Y + Z*Z);
    if (norme == 0.0) {
      W = 1.0; 
      X = Y = Z = 0.0;
    } else {
      float recip = 1.0/norme;
      W *= recip;
      X *= recip;
      Y *= recip;
      Z *= recip;
    }
    return this;
  }

  float getAngle() {
    float sinhalfangle = sqrt(X*X+Y*Y+Z*Z);
    return 2.0 * atan2(sinhalfangle, W);
  }

  PVector getAxis() {
    float sinhalfangle = sqrt(X*X+Y*Y+Z*Z);
    if (sinhalfangle>0) {
      PVector axis = new PVector(X, Y, Z);
      axis.div(sinhalfangle);
      return axis;
    } else return new PVector(0, 0, 1);
  }
}

