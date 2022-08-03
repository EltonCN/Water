#ifndef DILATE_INCLUDED
#define DILATE_INCLUDED

void Dilate_float(float2 UV, UnityTexture2D inputTexture, UnitySamplerState ss, 
                    float kernelSize, float offset, float threshould, bool lessThen, out float3 Out)
{
    float3 result;

    int min_index = (int) (kernelSize / 2.0);
    int n = (int) pow(kernelSize, 2);


    result.r = 0;
    result.g = 0;
    result.b = 0;
 

    bool ended = false;
    float2 targetUV;

    for (int i = -min_index; i <= min_index; i++) 
    {
        targetUV.x = UV.x+(offset*i);

        for (int j = -min_index; j <= min_index; j++) 
        {

            targetUV.y = UV.y+(offset*j);

            float4 rgb = SAMPLE_TEXTURE2D_LOD(inputTexture, ss, targetUV, 0);

            for(int k = 0; k<3; k++)
            {
                if(!lessThen)
                { 
                    if(rgb[k] > threshould)
                    {
                        result[k] = 1.0;
                    }
                    
                }
                else
                {
                    if(rgb[k] < threshould)
                    {
                        result[k] = 1.0;
                    }
                }
            }
            

            if(rgb.r == 1 && rgb.g == 1 && rgb.b == 1)
            {
                ended = true;
                break;
            }

            if(ended)
            {
                break;
            }
        }
        
    }

    Out = result;
}

#endif