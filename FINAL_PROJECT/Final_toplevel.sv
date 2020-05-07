module Final_toplevel(
    //////////// CLOCK //////////
    input		          		CLOCK_50,
    input		          		CLOCK2_50,
    input		          		CLOCK3_50,
    //////////// Sma //////////
    input		          		SMA_CLKIN,
    output	logic       		SMA_CLKOUT,
    //////////// LED //////////
    output	logic	     [8:0]		LEDG,
    output	logic	    [17:0]		LEDR,
    //////////// KEY //////////
    input		     [3:0]		KEY,
    //////////// EJTAG //////////
    inout	wire	     [6:0]		EX_IO,
    //////////// SW //////////
    input		    [17:0]		SW,
    //////////// SEG7 //////////
    output	logic	     [6:0]		HEX0,
    output	logic	     [6:0]		HEX1,
    output	logic	     [6:0]		HEX2,
    output	logic	     [6:0]		HEX3,
    output	logic	     [6:0]		HEX4,
    output	logic	     [6:0]		HEX5,
    output	logic	     [6:0]		HEX6,
    output	logic	     [6:0]		HEX7,
    //////////// LCD //////////
    output	logic	          		LCD_BLON,
    inout	wire	     [7:0]		LCD_DATA,
    output	logic	          		LCD_EN,
    output	logic	          		LCD_ON,
    output	logic	          		LCD_RS,
    output	logic	          		LCD_RW,
    //////////// RS232 //////////
    output	logic	          		UART_CTS,
    input		          		UART_RTS,
    input		          		UART_RXD,
    output	logic	          		UART_TXD,
    //////////// PS2 for Keyboard and Mouse //////////
    inout	wire	          		PS2_CLK,
    inout	wire	          		PS2_CLK2,
    inout	wire	          		PS2_DAT,
    inout	wire	          		PS2_DAT2,
    //////////// SDCARD //////////
    output	logic	          		SD_CLK,
    inout	wire	          		SD_CMD,
    inout	wire	     [3:0]		SD_DAT,
    input		          		SD_WP_N,
    //////////// VGA //////////
    output	logic	     [7:0]		VGA_B,
    output	logic	          		VGA_BLANK_N,
    output	logic	          		VGA_CLK,
    output	logic	     [7:0]		VGA_G,
    output	logic	          		VGA_HS,
    output	logic	     [7:0]		VGA_R,
    output	logic	          		VGA_SYNC_N,
    output	logic	          		VGA_VS,
    //////////// Audio //////////
    input		             		AUD_ADCDAT,
    inout	wire	          		AUD_ADCLRCK,
    inout	wire	          		AUD_BCLK,
    output	logic	          		AUD_DACDAT,
    inout	wire	          		AUD_DACLRCK,
    output	logic	          		AUD_XCK,
    //////////// I2C for EEPROM //////////
    output	logic	          		EEP_I2C_SCLK,
    inout	wire	          		EEP_I2C_SDAT,
    //////////// I2C for Audio Tv-Decoder  //////////
    output	logic	          		I2C_SCLK,
    inout	wire	          		I2C_SDAT,
    //////////// Ethernet 0 //////////
    output	logic	          		ENET0_GTX_CLK,
    input		          		ENET0_INT_N,
    input		          		ENET0_LINK100,
    output	logic	          		ENET0_MDC,
    inout	wire	          		ENET0_MDIO,
    output	logic	          		ENET0_RST_N,
    input		          		ENET0_RX_CLK,
    input		          		ENET0_RX_COL,
    input		          		ENET0_RX_CRS,
    input		     [3:0]		ENET0_RX_DATA,
    input		          		ENET0_RX_DV,
    input		          		ENET0_RX_ER,
    input		          		ENET0_TX_CLK,
    output	logic	     [3:0]		ENET0_TX_DATA,
    output	logic	          		ENET0_TX_EN,
    output	logic	          		ENET0_TX_ER,
    input		          		ENETCLK_25,
    //////////// Ethernet 1 //////////
    output	logic	          		ENET1_GTX_CLK,
    input		          		ENET1_INT_N,
    input		          		ENET1_LINK100,
    output	logic	          		ENET1_MDC,
    inout	wire	          		ENET1_MDIO,
    output	logic	          		ENET1_RST_N,
    input		          		ENET1_RX_CLK,
    input		          		ENET1_RX_COL,
    input		          		ENET1_RX_CRS,
    input		     [3:0]		ENET1_RX_DATA,
    input		          		ENET1_RX_DV,
    input		          		ENET1_RX_ER,
    input		          		ENET1_TX_CLK,
    output	logic	     [3:0]		ENET1_TX_DATA,
    output	logic	          		ENET1_TX_EN,
    output	logic	          		ENET1_TX_ER,
    //////////// TV Decoder //////////
    input		          		TD_CLK27,
    input		     [7:0]		TD_DATA,
    input		          		TD_HS,
    output	logic	          		TD_RESET_N,
    input		          		TD_VS,
    //////////// USB 2.0 OTG //////////
    output	logic	     [1:0]		OTG_ADDR,
    output	logic	          		OTG_CS_N,
    output	logic	     [1:0]		OTG_DACK_N,
    inout	wire	    [15:0]		OTG_DATA,
    input		     [1:0]		OTG_DREQ,
    inout	wire	          		OTG_FSPEED,
    input		     [1:0]		OTG_INT,
    inout	wire	          		OTG_LSPEED,
    output	logic	          		OTG_RD_N,
    output	logic	          		OTG_RST_N,
    output	logic	          		OTG_WE_N,
    //////////// IR Receiver //////////
    input		          		IRDA_RXD,
    //////////// SDRAM //////////
    output	logic	    [12:0]		DRAM_ADDR,
    output	logic	     [1:0]		DRAM_BA,
    output	logic	          		DRAM_CAS_N,
    output	logic	          		DRAM_CKE,
    output	logic	          		DRAM_CLK,
    output	logic	          		DRAM_CS_N,
    inout	wire	    [31:0]		DRAM_DQ,
    output	logic	     [3:0]		DRAM_DQM,
    output	logic	          		DRAM_RAS_N,
    output	logic	          		DRAM_WE_N,
    //////////// SRAM //////////
    output	logic	    [19:0]		SRAM_ADDR,
    output	logic	          		SRAM_CE_N,
    inout	wire	    [15:0]		SRAM_DQ,
    output	logic	          		SRAM_LB_N,
    output	logic	          		SRAM_OE_N,
    output	logic	          		SRAM_UB_N,
    output	logic	          		SRAM_WE_N,
    //////////// Flash //////////
    output	logic	    [22:0]		FL_ADDR,
    output	logic	          		FL_CE_N,
    inout	wire	     [7:0]		FL_DQ,
    output	logic	          		FL_OE_N,
    output	logic	          		FL_RST_N,
    input		          		FL_RY,
    output	logic	          		FL_WE_N,
    output	logic	          		FL_WP_N,
    //////////// GPIO, GPIO connect to D5M - 5M Pixel Camera //////////
    input		    [11:0]		D5M_D,
    input		          		D5M_FVAL,
    input		          		D5M_LVAL,
    input		          		D5M_PIXLCLK,
    output	logic	          		D5M_RESET_N,
    output	logic	          		D5M_SCLK,
    inout	wire	          		D5M_SDATA,
    input		          		D5M_STROBE,
    output	logic	          		D5M_TRIGGER,
    output	logic             		D5M_XCLKIN
	);

logic   [12:0]      x_pos;
logic   [12:0]      y_pos;
logic   [12:0]      mX_cont;
logic   [12:0]      mY_cont;
logic               disp_flag;
logic               store_flag;
logic   [7:0]       grey_out;
logic               op_CLK;     //40M
logic   [15:0]      Data_to_SRAM;
logic   [15:0]      Data_from_SRAM;
logic   [15:0]      Data_from_sys;
logic   [15:0]      img_data;
logic   [7:0]       resizedPixel;
logic               Pixel_out_Clk;
logic 				  test_img_pxl;
logic		[7:0] 		test_img_x;
logic		[7:0] 		test_img_y;
logic						rd_CLK;		//The clock of the model
logic 	[7:0] 		rd_xpos,rd_ypos;
logic		[28*28-1:0]				data_from_buffer;
logic 					wr_en, rd_en;
logic 	[14:0] 		weight_addr_w1;
logic		[31:0]		weight_data_w1;
logic 	[8:0] 		weight_addr_w2;
logic		[31:0]		weight_data_w2;
logic 	[7:0] 		weight_addr_w3;
logic		[31:0]		weight_data_w3;
logic 	[4:0] 		weight_addr_b1;
logic		[31:0]		weight_data_b1;
logic 	[3:0] 		weight_addr_b2;
logic		[31:0]		weight_data_b2;
logic 	[3:0] 		weight_addr_b3;
logic		[31:0]		weight_data_b3;
logic 	[4:0]			pred;
logic 					scan_flag, nn_flag;
assign op_CLK = ~VGA_CLK;
//assign pred = 5'd7;
DE2_115_CAMERA Camera(
    .*,
    .x_coord(x_pos),
    .y_coord(y_pos),
    .isdisplay(disp_flag),
	 .predict(pred)
);

Snipper u_snipper(
	 .iClk(op_CLK), 
	 .iRst(KEY[0]),
	 .isdisplay(disp_flag),
    .X_coord(x_pos),
    .Y_coord(y_pos),
	 .oX_cont(mX_cont),
	 .oY_cont(mY_cont),
    .isstore(store_flag)
);

//RGB to Grey scale converter
RGB2Grey    u_rgb_2_grey(
    .iRed(VGA_R),
    .iGreen(VGA_G),
	 .iBlue(VGA_B),
    .ogrey(grey_out)
);

ResizerFile u_resizer(
	.Clk(op_CLK),
	.Reset(KEY[0]),
	.isStore(store_flag),
	.x_cont(mX_cont),
	.y_cont(mY_cont),
	.ipixel(grey_out),
	.opixel(test_img_pxl),
	.oX_pos(test_img_x),
	.oY_pos(test_img_y),
	.wr_pxl(wr_en)
);

OCMbuffer u_ocm_buf(
	.Clk(op_CLK),
	.Reset(KEY[0]),
	.write(wr_en),
	.ipixel(test_img_pxl),
	.odata(data_from_buffer),
	.ready(scan_flag)
);

nn u_nn(
	 .Clk(op_CLK),
	 .Rst(KEY[0]),
	 .Start(scan_flag),
    .data(data_from_buffer),
    .prediction(pred),
	 .resp(nn_flag),
	 .rdata(SRAM_DQ),
	 .address(SRAM_ADDR),
	 .CE(SRAM_CE_N),
	 .LB(SRAM_LB_N),
	 .OE(SRAM_OE_N),
	 .WE(SRAM_WE_N),
	 .UB(SRAM_UB_N)
);


endmodule 