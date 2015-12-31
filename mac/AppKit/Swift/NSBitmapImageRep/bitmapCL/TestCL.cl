__kernel

void matvec_mult(__global float4* matrix,
                          __global float4* vector,
                          __global float* result) {
    
    int i = get_global_id(0);
    result[i] = dot(matrix[i], vector[0]);
}

//インクリメントする
void addone(__global float* data, const int n)
{
    int index = get_global_id(0);
    
    if (index < n) {
        data[index] += 1.0f;
    }
}