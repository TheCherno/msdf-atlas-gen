include "msdfgen"

-- Force premake not to generate over the top of existing `Makefile`.
project "msdf-atlas-gen-dummy"
	kind "StaticLib"
    files { "%{HazelRootDirectory}/Hazel-ScriptCore/Source/Dummy.cpp" }

project "msdf-atlas-gen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	DefaultTargetParams(true)

	files
	{
		"msdf-atlas-gen/**.h",
    	"msdf-atlas-gen/**.hpp",
    	"msdf-atlas-gen/**.cpp"
	}

	includedirs
	{
		"msdf-atlas-gen",
		"msdfgen",
		"msdfgen/include"
	}

	links
	{
		"msdfgen"
	}
