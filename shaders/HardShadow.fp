const float pi = 3.14159265359;
vec4 Process(vec4 color)
{
	vec3 lightDir = vec3(0.75,-1.0,0.5);
 
	vec2 texCoord = gl_TexCoord[0].st;
	vec3 l = lightDir;
	vec3 n = normalize(vWorldNormal.xyz);
	float angle = acos
	(
		(l.x*n.x + l.y*n.y + l.z * n.z) 
		/ 
		(
			(	
				sqrt
				(
					(l.x*l.x)+(l.y*l.y)+(l.z*l.z)
				) 
				* 
				sqrt
				(
					(n.x*n.x) + (n.y*n.y) + (n.z*n.z)
				)
			)
		)
	);
	float lightLevel = angle;
	lightLevel /= pi;
	if(lightLevel < 0.333)
	{
		return vec4(0,0,0,getTexel(texCoord).a);
	}
	if(lightLevel > 0.666)
	{
		lightLevel = 1.0;
	}
	else
	{
		lightLevel = 0.5;
	}
	return getTexel(texCoord) * color * vec4(lightLevel,lightLevel,lightLevel,getTexel(texCoord).a);
}