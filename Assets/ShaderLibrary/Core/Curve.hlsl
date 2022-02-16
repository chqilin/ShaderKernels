#ifndef _SHADERFAB_MATH_CURVE_HLSL_
#define _SHADERFAB_MATH_CURVE_HLSL_

float QuadraticBezier1D(float t, float p0, float p1, float3 p2)
{
    return
        p0 * (1.0 - t) * (1.0 - t) +
        p1 * 2 * t * (1.0 - t) +
        p2 * t * t;
}

float2 QuadraticBezier2D(float t, float2 p0, float2 p1, float2 p2)
{
    return
        p0 * (1.0 - t) * (1.0 - t) +
        p1 * 2 * t * (1.0 - t) +
        p2 * t * t;
}

float3 QuadraticBezier3D(float t, float3 p0, float3 p1, float3 p2)
{
    return
        p0 * (1.0 - t) * (1.0 - t) +
        p1 * 2 * t * (1.0 - t) +
        p2 * t * t;
}

float CubicBezier1D(float t, float p0, float p1, float p2, float p3)
{
    return
        p0 * (1.0 - t) * (1.0 - t) * (1.0 - t) +
        p1 * 3 * t * (1.0 - t) * (1.0 - t) +
        p2 * 3 * t * t * (1.0 - t) +
        p3 * t * t * t;
}

float2 CubicBezier2D(float t, float2 p0, float2 p1, float2 p2, float2 p3)
{
    return
        p0 * (1.0 - t) * (1.0 - t) * (1.0 - t) +
        p1 * 3 * t * (1.0 - t) * (1.0 - t) +
        p2 * 3 * t * t * (1.0 - t) +
        p3 * t * t * t;
}

float3 CubicBezier3D(float t, float3 p0, float3 p1, float3 p2, float3 p3)
{
    return
        p0 * (1.0 - t) * (1.0 - t) * (1.0 - t) +
        p1 * 3 * t * (1.0 - t) * (1.0 - t) +
        p2 * 3 * t * t * (1.0 - t) +
        p3 * t * t * t;
}

#endif//_SHADERFAB_MATH_CURVE_HLSL_
