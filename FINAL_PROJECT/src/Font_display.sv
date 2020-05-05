module Font_display(
	input logic [12:0] sprite_addr,
	input logic [12:0] ix_cont,
	input logic [12:0] iy_cont,
	output logic Font_on
);
parameter FONT_STARTX = 630;
parameter FONT_STARTY = 220;

logic [7:0] sprite_data;

font_rom 	u_fr (.addr(sprite_addr), .data(sprite_data));

Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY), .YEND(FONT_STARTY+10)) u_fr_rsr11(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY), .YEND(FONT_STARTY+10)) u_fr_rsr21(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY), .YEND(FONT_STARTY+10)) u_fr_rsr31(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY), .YEND(FONT_STARTY+10)) u_fr_rsr41(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY), .YEND(FONT_STARTY+10)) u_fr_rsr51(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY), .YEND(FONT_STARTY+10)) u_fr_rsr61(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY), .YEND(FONT_STARTY+10)) u_fr_rsr71(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY), .YEND(FONT_STARTY+10)) u_fr_rsr81(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+10), .YEND(FONT_STARTY+20)) u_fr_rsr12(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+10), .YEND(FONT_STARTY+20)) u_fr_rsr22(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+10), .YEND(FONT_STARTY+20)) u_fr_rsr32(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+10), .YEND(FONT_STARTY+20)) u_fr_rsr42(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+10), .YEND(FONT_STARTY+20)) u_fr_rsr52(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+10), .YEND(FONT_STARTY+20)) u_fr_rsr62(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+10), .YEND(FONT_STARTY+20)) u_fr_rsr72(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+10), .YEND(FONT_STARTY+20)) u_fr_rsr82(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+20), .YEND(FONT_STARTY+30)) u_fr_rsr13(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+20), .YEND(FONT_STARTY+30)) u_fr_rsr23(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+20), .YEND(FONT_STARTY+30)) u_fr_rsr33(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+20), .YEND(FONT_STARTY+30)) u_fr_rsr43(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+20), .YEND(FONT_STARTY+30)) u_fr_rsr53(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+20), .YEND(FONT_STARTY+30)) u_fr_rsr63(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+20), .YEND(FONT_STARTY+30)) u_fr_rsr73(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+20), .YEND(FONT_STARTY+30)) u_fr_rsr83(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+30), .YEND(FONT_STARTY+40)) u_fr_rsr14(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+30), .YEND(FONT_STARTY+40)) u_fr_rsr24(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+30), .YEND(FONT_STARTY+40)) u_fr_rsr34(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+30), .YEND(FONT_STARTY+40)) u_fr_rsr44(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+30), .YEND(FONT_STARTY+40)) u_fr_rsr54(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+30), .YEND(FONT_STARTY+40)) u_fr_rsr64(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+30), .YEND(FONT_STARTY+40)) u_fr_rsr74(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+30), .YEND(FONT_STARTY+40)) u_fr_rsr84(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+40), .YEND(FONT_STARTY+50)) u_fr_rsr15(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+40), .YEND(FONT_STARTY+50)) u_fr_rsr25(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+40), .YEND(FONT_STARTY+50)) u_fr_rsr35(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+40), .YEND(FONT_STARTY+50)) u_fr_rsr45(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+40), .YEND(FONT_STARTY+50)) u_fr_rsr55(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+40), .YEND(FONT_STARTY+50)) u_fr_rsr65(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+40), .YEND(FONT_STARTY+50)) u_fr_rsr75(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+40), .YEND(FONT_STARTY+50)) u_fr_rsr85(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+50), .YEND(FONT_STARTY+60)) u_fr_rsr16(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+50), .YEND(FONT_STARTY+60)) u_fr_rsr26(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+50), .YEND(FONT_STARTY+60)) u_fr_rsr36(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+50), .YEND(FONT_STARTY+60)) u_fr_rsr46(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+50), .YEND(FONT_STARTY+60)) u_fr_rsr56(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+50), .YEND(FONT_STARTY+60)) u_fr_rsr66(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+50), .YEND(FONT_STARTY+60)) u_fr_rsr76(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+50), .YEND(FONT_STARTY+60)) u_fr_rsr86(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+60), .YEND(FONT_STARTY+70)) u_fr_rsr17(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+60), .YEND(FONT_STARTY+70)) u_fr_rsr27(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+60), .YEND(FONT_STARTY+70)) u_fr_rsr37(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+60), .YEND(FONT_STARTY+70)) u_fr_rsr47(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+60), .YEND(FONT_STARTY+70)) u_fr_rsr57(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+60), .YEND(FONT_STARTY+70)) u_fr_rsr67(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+60), .YEND(FONT_STARTY+70)) u_fr_rsr77(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+60), .YEND(FONT_STARTY+70)) u_fr_rsr87(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+70), .YEND(FONT_STARTY+80)) u_fr_rsr18(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+70), .YEND(FONT_STARTY+80)) u_fr_rsr28(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+70), .YEND(FONT_STARTY+80)) u_fr_rsr38(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+70), .YEND(FONT_STARTY+80)) u_fr_rsr48(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+70), .YEND(FONT_STARTY+80)) u_fr_rsr58(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+70), .YEND(FONT_STARTY+80)) u_fr_rsr68(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+70), .YEND(FONT_STARTY+80)) u_fr_rsr78(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+70), .YEND(FONT_STARTY+80)) u_fr_rsr88(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+80), .YEND(FONT_STARTY+90)) u_fr_rsr19(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+80), .YEND(FONT_STARTY+90)) u_fr_rsr29(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+80), .YEND(FONT_STARTY+90)) u_fr_rsr39(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+80), .YEND(FONT_STARTY+90)) u_fr_rsr49(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+80), .YEND(FONT_STARTY+90)) u_fr_rsr59(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+80), .YEND(FONT_STARTY+90)) u_fr_rsr69(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+80), .YEND(FONT_STARTY+90)) u_fr_rsr79(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+80), .YEND(FONT_STARTY+90)) u_fr_rsr89(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+90), .YEND(FONT_STARTY+100)) u_fr_rsr110(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+90), .YEND(FONT_STARTY+100)) u_fr_rsr210(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+90), .YEND(FONT_STARTY+100)) u_fr_rsr310(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+90), .YEND(FONT_STARTY+100)) u_fr_rsr410(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+90), .YEND(FONT_STARTY+100)) u_fr_rsr510(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+90), .YEND(FONT_STARTY+100)) u_fr_rsr610(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+90), .YEND(FONT_STARTY+100)) u_fr_rsr710(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+90), .YEND(FONT_STARTY+100)) u_fr_rsr810(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+100), .YEND(FONT_STARTY+110)) u_fr_rsr111(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+100), .YEND(FONT_STARTY+110)) u_fr_rsr211(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+100), .YEND(FONT_STARTY+110)) u_fr_rsr311(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+100), .YEND(FONT_STARTY+110)) u_fr_rsr411(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+100), .YEND(FONT_STARTY+110)) u_fr_rsr511(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+100), .YEND(FONT_STARTY+110)) u_fr_rsr611(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+100), .YEND(FONT_STARTY+110)) u_fr_rsr711(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+100), .YEND(FONT_STARTY+110)) u_fr_rsr811(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+110), .YEND(FONT_STARTY+120)) u_fr_rsr112(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+110), .YEND(FONT_STARTY+120)) u_fr_rsr212(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+110), .YEND(FONT_STARTY+120)) u_fr_rsr312(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+110), .YEND(FONT_STARTY+120)) u_fr_rsr412(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+110), .YEND(FONT_STARTY+120)) u_fr_rsr512(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+110), .YEND(FONT_STARTY+120)) u_fr_rsr612(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+110), .YEND(FONT_STARTY+120)) u_fr_rsr712(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+110), .YEND(FONT_STARTY+120)) u_fr_rsr812(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+120), .YEND(FONT_STARTY+130)) u_fr_rsr113(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+120), .YEND(FONT_STARTY+130)) u_fr_rsr213(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+120), .YEND(FONT_STARTY+130)) u_fr_rsr313(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+120), .YEND(FONT_STARTY+130)) u_fr_rsr413(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+120), .YEND(FONT_STARTY+130)) u_fr_rsr513(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+120), .YEND(FONT_STARTY+130)) u_fr_rsr613(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+120), .YEND(FONT_STARTY+130)) u_fr_rsr713(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+120), .YEND(FONT_STARTY+130)) u_fr_rsr813(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+130), .YEND(FONT_STARTY+140)) u_fr_rsr114(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+130), .YEND(FONT_STARTY+140)) u_fr_rsr214(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+130), .YEND(FONT_STARTY+140)) u_fr_rsr314(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+130), .YEND(FONT_STARTY+140)) u_fr_rsr414(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+130), .YEND(FONT_STARTY+140)) u_fr_rsr514(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+130), .YEND(FONT_STARTY+140)) u_fr_rsr614(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+130), .YEND(FONT_STARTY+140)) u_fr_rsr714(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+130), .YEND(FONT_STARTY+140)) u_fr_rsr814(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+140), .YEND(FONT_STARTY+150)) u_fr_rsr115(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+140), .YEND(FONT_STARTY+150)) u_fr_rsr215(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+140), .YEND(FONT_STARTY+150)) u_fr_rsr315(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+140), .YEND(FONT_STARTY+150)) u_fr_rsr415(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+140), .YEND(FONT_STARTY+150)) u_fr_rsr515(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+140), .YEND(FONT_STARTY+150)) u_fr_rsr615(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+140), .YEND(FONT_STARTY+150)) u_fr_rsr715(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+140), .YEND(FONT_STARTY+150)) u_fr_rsr815(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX), .XEND(FONT_STARTX+10), .YSTART(FONT_STARTY+150), .YEND(FONT_STARTY+160)) u_fr_rsr116(.ipixel(sprite_data[7]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+10), .XEND(FONT_STARTX+20), .YSTART(FONT_STARTY+150), .YEND(FONT_STARTY+160)) u_fr_rsr216(.ipixel(sprite_data[6]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+20), .XEND(FONT_STARTX+30), .YSTART(FONT_STARTY+150), .YEND(FONT_STARTY+160)) u_fr_rsr316(.ipixel(sprite_data[5]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+30), .XEND(FONT_STARTX+40), .YSTART(FONT_STARTY+150), .YEND(FONT_STARTY+160)) u_fr_rsr416(.ipixel(sprite_data[4]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+40), .XEND(FONT_STARTX+50), .YSTART(FONT_STARTY+150), .YEND(FONT_STARTY+160)) u_fr_rsr516(.ipixel(sprite_data[3]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+50), .XEND(FONT_STARTX+60), .YSTART(FONT_STARTY+150), .YEND(FONT_STARTY+160)) u_fr_rsr616(.ipixel(sprite_data[2]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+60), .XEND(FONT_STARTX+70), .YSTART(FONT_STARTY+150), .YEND(FONT_STARTY+160)) u_fr_rsr716(.ipixel(sprite_data[1]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 
Font_resizer #(.XSTART(FONT_STARTX+70), .XEND(FONT_STARTX+80), .YSTART(FONT_STARTY+150), .YEND(FONT_STARTY+160)) u_fr_rsr816(.ipixel(sprite_data[0]), .ix_cont(ix_cont), .iy_cont(ix_cont), .Font_on(Font_on)); 

endmodule 