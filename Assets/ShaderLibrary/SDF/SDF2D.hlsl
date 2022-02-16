#ifndef _SHADERFAB_SDF_SDF2D_HLSL_
#define _SHADERFAB_SDF_SDF2D_HLSL_

float SDF2D_Circle(float2 p, float radius)
{
    return length(p) - radius;
}

float SDF2D_OP_Round(float sd, float r)
{
    return sd - r;
}

float SDF2D_OP_Onion(float sd, float r)
{
    return abs(sd) - r;
}

#endif//_SHADERFAB_SDF_SDF2D_HLSL_
