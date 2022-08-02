#ifndef BLURTEXTURE_INCLUDED
#define BLURTEXTURE_INCLUDED

void BlurTexture_float(float2 UV, UnityTexture2D  sharpTexture, UnitySamplerState stex, float kernelSize, float offset, out float3 Out) 
{
    float3 result;

    int min_index = (int) (kernelSize / 2.0);
    int n = (int) pow(kernelSize, 2);


    result.r = 0;
    result.g = 0;
    result.b = 0;
 
    float2 targetUV;

    for (int i = -min_index; i <= min_index; i++) 
    {
        targetUV.x = UV.x+(offset*i);

        for (int j = -min_index; j <= min_index; j++) 
        {

            targetUV.y = UV.y+(offset*j);

            float4 rgb = SAMPLE_TEXTURE2D_LOD(sharpTexture, stex, targetUV, 0);


            result.r += rgb.r;
            result.g += rgb.g;
            result.b += rgb.b;
        }
        
    }

    result.r /= n;
    result.g /= n;
    result.b /= n;

    Out = result;

}

#endif