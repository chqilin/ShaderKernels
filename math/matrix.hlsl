#ifndef _SHADERFAB_MATH_MATRIX_HLSL_
#define _SHADERFAB_MATH_MATRIX_HLSL_

float4x4 matrixIdentity()
{
    return float4x4(
        1, 0, 0, 0,
        0, 1, 0, 0,
        0, 0, 1, 0,
        0, 0, 0, 1
    );
}

float4x4 matrixTranslate(float3 t)
{
    return float4x4(
        1,  0,  0,  t.x,
        0,  1,  0,  t.y,
        0,  0,  1,  t.z,
        0,  0,  0,  1
    );
}

/*
 * Create a matrix with angle and axis.
 */
float4x4 matrixRotationAngleAxis(float angle, float3 axis)
{
    float c, s;
    sincos(angle, s, c);
    float t = 1 - c;
    float x = axis.x;
    float y = axis.y;
    float z = axis.z;
    return float4x4
    (
        t * x * x + c,      t * x * y - s * z,  t * x * z + s * y,  0,
        t * x * y + s * z,  t * y * y + c,      t * y * z - s * x,  0,
        t * x * z - s * y,  t * y * z + s * x,  t * z * z + c,      0,
        0,                  0,                  0,                  1
    );
}

/*
 * Create a matrix for scale(x, y, z)
 */
float4x4 matrixScale(float x, float y, float z)
{
    return float4x4
    (
        x, 0, 0, 0,
        0, y, 0, 0,
        0, 0, z, 0,
        0, 0, 0, 1
    );
}


/*
 * Create a matrix for tangent-local transform.
 */
float4x4 matrixTangentToLocal(float3 tangent, float3 normal)
{
    float3 binormal = cross(normal, tangent);
    return float4x4
    (
        tangent.x,  binormal.x, normal.x,   0,
        tangent.y,  binormal.y, normal.y,   0,
        tangent.z,  binormal.z, normal.z,   0,
        0,          0,          0,          1
    );
}

#endif//_SHADERFAB_MATH_MATRIX_HLSL_