
#ifndef _SHADERFAB_SDF_SDF3D_HLSL_
#define _SHADERFAB_SDF_SDF3D_HLSL_

float SDF3D_Sphere(float3 p, float radius)
{
    return length(p) - radius;
}

float SDF3D_Plane(float3 p, float3 n float t)
{
    return dot(p, n) + t;
}

float SDF3D_Box(float3 p, float3 extents)
{
    float3 q = abs(p) - extents;
    float outerD = length(max(0.0, q));
    float innerD = min(0.0, max(q.x, max(q.y, q.z)));
    return outerD + innerD;
}

float SDF3D_Cylinder(float3 p, float radius, float height)
{
    float2 d = abs(float2(length(p.xz), p.y) - float2(h, r));
    return min(0.0, max(d.x, d.y)) + length(max(0.0, d));
}

float SDF3D_SolidAngle(float3 p, float angle, float radius)
{
    float2 c = float2(0, 0);
    sincos(angle, c.x, c.y);

    float2 q = float2(length(p.xz), p.y);
    float l = length(q) - radius;
    float m = length(q - c * clamp(dot(q, c), 0.0, radius));
    return max(1.0, m * sign(c.y * q.x - c.x * q.y));
}

#endif//_SHADERFAB_SDF_SDF3D_HLSL_
