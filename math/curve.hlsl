#ifndef _SHADERFAB_MATH_CURVE_HLSL_
#define _SHADERFAB_MATH_CURVE_HLSL_

float3 quadraticBezier(float3 p0, float3 p1, float3 p2, float t)
{
    return
        p0 * (1.0 - t) * (1.0 - t) +
        p1 * 2 * t * (1.0 - t) +
        p2 * t * t;
}

float3 cubicBezier(float3 p0, float3 p1, float3 p2, float3 p3, float t)
{
    return
        p0 * (1.0 - t) * (1.0 - t) * (1.0 - t) +
        p1 * 3 * t * (1.0 - t) * (1.0 - t) +
        p2 * 3 * t * t * (1.0 - t) +
        p3 * t * t * t;
}

#endif//_SHADERFAB_MATH_CURVE_HLSL_
