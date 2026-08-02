#=================== ImGui ===================
target_sources(ImGui
	PRIVATE
	${imgui_SOURCE_DIR}/backends/imgui_impl_dx11.cpp
	${imgui_SOURCE_DIR}/backends/imgui_impl_win32.cpp
)

if(MINGW)
	# The Win32 and DirectX backends reference these APIs directly. Keeping the
	# imports on ImGui also places them after the static archive at link time.
	target_link_libraries(ImGui PUBLIC d3dcompiler dwmapi)
endif()

find_package(SDL2 CONFIG REQUIRED)
target_link_libraries(ImGui PUBLIC SDL2::SDL2 SDL2::SDL2main)

find_package(GLEW REQUIRED)
target_link_libraries(ImGui PUBLIC opengl32 GLEW::GLEW)
