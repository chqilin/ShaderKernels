#ifndef _SHADERFAB_MATH_RANDOM_HLSL_
#define _SHADERFAB_MATH_RANDOM_HLSL_

/*
Following functions from Roystan's code:
 (https://github.com/IronWarrior/UnityGrassGeometryShader)

Simple noise function, sourced from http://answers.unity.com/answers/624136/view.html
Extended discussion on this function can be found at the following link:
https://forum.unity.com/threads/am-i-over-complicating-this-random-function.454887/#post-2949326
Returns a number in the 0...1 range.
*/
float random(float3 seed)
{
    return frac(sin(dot(seed.xyz, float3(12.9898, 78.233, 53.539))) * 43758.5453);
}

float randomRange(float3 seed, float2 range)
{
    return range.x + random(seed) * (range.y - range.x);
}

#endif//_SHADERFAB_MATH_RANDOM_HLSL_
