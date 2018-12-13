require 'cairo'
function draw_text()
	if conky_window==nil then return end
	local w=conky_window.width
	local h=conky_window.height
	local cs=cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, w, h)
	cr=cairo_create(cs)

	
		
-- Seleccionar font
	cairo_select_font_face (cr, "Impact", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);

-- Cambiar tamaño (código ejemplo)
--cairo_set_font_size (cr, 60.0);

--Cambiar color (código ejemplo)
--cairo_set_source_rgba (cr, 0.192156863, 0.180392157, 0.156862745, 1);

--Redimensionar área (código ejemplo)
--cairo_translate (cr, 0.0, 0.0);

-- Ángulo (en radianes)
	--cairo_rotate(cr,0.785398163);
	cairo_rotate(cr,-0.4);
-- "Mover" puntero (Código ejemplo)
--cairo_move_to (cr, 0.0, 0.0);

-- Texto:

-- Horario y fecha
	cairo_set_font_size (cr, 42.0);
--Mes
	cairo_move_to (cr, 900, 550);
	cairo_set_source_rgba (cr, 0.980392157, 0.980392157, 0.980392157, 1);
	cairo_show_text (cr, conky_parse('${time |%B}'));
	cairo_move_to (cr, 1100, 580.0); --mes 
	cairo_set_font_size (cr, 84.0);
	cairo_show_text (cr, conky_parse('${time %d}'));
	cairo_set_font_size (cr, 42.0);
	cairo_move_to (cr, 900.0, 500.0);--dia
	cairo_show_text (cr, conky_parse('${time |%A}'));
	cairo_set_font_size (cr, 84.0);
	cairo_move_to (cr, 900.0, 660.0);--hora
	cairo_show_text (cr, conky_parse('${time %k:%M}'));

--CPU1 (Texto)
	cairo_set_font_size (cr, 30.0);
	cairo_move_to (cr, 900.0, 700.0);
	cairo_set_source_rgba (cr, 0.11372549, 0.11372549, 0.11372549, 0.7);
	cairo_show_text (cr, conky_parse('CPU1:'));

--CPU2 (Texto)
	cairo_move_to (cr, 900.0, 740.0);
	cairo_show_text (cr, conky_parse('CPU2:'));

--CPU1 y CPU2 (Porcentaje)
	cairo_move_to (cr, 1000, 700);
	cairo_show_text (cr, conky_parse('${cpu cpu1}%'));
	cairo_move_to (cr, 1000, 740);
	cairo_show_text (cr, conky_parse('${cpu cpu2}%'));

--RAM
	cairo_set_font_size (cr, 35.0);
	cairo_move_to (cr, 900, 780);
	cairo_set_source_rgba (cr, 0.129411765, 0.411764706, 0.490196078, 1);
	cairo_show_text (cr, conky_parse('RAM: ${mem}'));


--Espacio libre partición /
	cairo_set_font_size (cr, 30.0);
	cairo_move_to (cr, 900, 820);
	cairo_set_source_rgba (cr, 0.529411765, 0.164705882, 0.0470588235, 1);
	cairo_show_text (cr, conky_parse('/: ${fs_free /}'));


	cairo_stroke (cr);
end



function conky_load_text()
	if conky_window==nil then return end
	local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)

	local cr=cairo_create(cs)    

	local updates=conky_parse('${updates}')
	update_num=tonumber(updates)
    
	if update_num>5 then
		draw_text()
	
	end
	if value == nil then value = 0 

	end
end

