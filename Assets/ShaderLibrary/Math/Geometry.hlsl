
#ifndef _SHADERFAB_MATH_GEOMETRY_HLSL_
#define _SHADERFAB_MATH_GEOMETRY_HLSL_

float2 rotate2D(float2 v, float rad)
{
    float s, c;
    sincos(rad, s, c);
    return float2(v.x * c - v.y * s, v.x * s + v.y * c);
}

struct Bounds
{
    float3 min;
    float3 max;
};

/*
 * Frustum (eg. from a Camera) struct.
 */
struct Frustum
{
    float4 left;
    float4 right;
    float4 bottom;
    float4 top;
    float4 near;
    float4 far;
};

/*
 * Create a plane with normal and a in-plane point 'p'
 */
float4 planeNormalPoint(float3 normal, float3 p)
{
    return float4(normal, - dot(normal, p));
}

/*
 * Create a plane with 3 in-plane points. 
 */
float4 planePoint3(float3 a, float3 b, float3 c)
{
    float3 normal = normalize(cross(b-a, c-a));
    return planeNormalPoint(normal, a);
}

/*
 * if p is outside of plane.
 */
bool isOutsideOfPlane(float4 plane, float3 p)
{
    if(dot(plane.xyz, p) + plane.w > 0)
        return true;
    return false;
}

/*
 * if p is outside of frustum.
 */
bool isOutsideOfFrustum(Frustum frustum, float3 p)
{
    if(isOutsideOfPlane(frustum.left, p))
        return true;
    if(isOutsideOfPlane(frustum.right, p))
        return true;
    if(isOutsideOfPlane(frustum.bottom, p))
        return true;
    if(isOutsideOfPlane(frustum.top, p))
        return true;
    if(isOutsideOfPlane(frustum.near, p))
        return true;
    if(isOutsideOfPlane(frustum.far, p))
        return true;
    return false;
}

#endif//_SHADERFAB_MATH_GEOMETRY_HLSL_