Shader "Custom/Lambert" 
{
	Properties
	{
	  _MainTex("Texture", 2D) = "white" {}
	  _Albedo("Albedo", Color) = (1, 1, 1, 1)

	  _BumpMap ("Bumpmap", 2D) = "bump" {}

	  _NormalStrenght("Normal Strenght", Range(-3, 3)) = 1

	  //Rim
	  _RimColor ("Rim Color", Color) = (0.26, 0.19, 0.16, 0.0)
      _RimPower ("Rim Power", Range(0.5,8.0)) = 3.0

	 

	  
	}
	SubShader
	{
		  CGPROGRAM
		  #pragma surface surf Lambert

		  struct Input {
			  float2 uv_MainTex;

			  float2 uv_BumpMap;

			  float3 viewDir;
		  };

		  sampler2D _MainTex;

		  sampler2D _BumpMap;
		  
		  half4 _Albedo;
		  float _NormalStrenght;
		  //Rim
		  float4 _RimColor;
     	  float _RimPower;
		   

		  void surf(Input IN, inout SurfaceOutput o) 
		  {
			  o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Albedo.rgb;
			  float3 normal = UnpackNormal (tex2D (_BumpMap, IN.uv_BumpMap));
			  normal.z = normal.z / _NormalStrenght;
			  o.Normal = normal;
			  
			  //Rimlight
			  half rim = 1.0 - saturate(dot (normalize(IN.viewDir), o.Normal));
			  o.Emission = _RimColor.rgb * pow (rim, _RimPower);

			  
		  }
		  ENDCG
	}
}