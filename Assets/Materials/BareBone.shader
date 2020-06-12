// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

/*
	SUMMARY This Shader Writen by H.Omar 
*/
Shader "Hassan/barebone" {
	
	// Properties Section to collect data from user GUI 
	Properties {
		_Color ("Main Color", Color) = (1,1,1,1) // _Color is var name , (1,1,1,1) is RGBA value 
	}

	// SubShader to define Graphics Hardware API 
	SubShader {
	
		Pass {
			CGPROGRAM // define that we will Start CG code 

			// tell the compiler this is vertex Shader 
			#pragma vertex vert
		    // tell the compiler this is fragment Shader 
			#pragma fragment frag
			// uniform used to define a global variable 
			uniform half4 _Color; 

			struct vertexInput {
				float4 vertex : POSITION;
			};
			
			struct vertexOutput {
				float4 pos : SV_POSITION;
			}; 

			// body of 2 paragma functions 
			// this function to return the output vertcies 
			vertexOutput vert(vertexInput v){
				
				vertexOutput o;
				o.pos = UnityObjectToClipPos(v.vertex);
				return o;
			}
		    // this function to apply color on returned vertcies from the previous function  
			half4 frag(vertexOutput i):Color{
			return _Color; 
			}

			ENDCG
		}
	} 

}