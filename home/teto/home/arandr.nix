{
    enable = true;

    profiles = {
        desktop = {
            fingerprint = {
                HDMI-1 = "00ffffffffffff001e6d555b01010101011a010380301b78ea3135a5554ea1260c5054a54b00714f81809500b300a9c0810081c09040023a801871382d40582c4500e00e1100001e000000fd00384b1e5512000a202020202020000000fc004c472046554c4c2048440a2020000000ff000a202020202020202020202020016102031bf14890040301121f1013230907078301000065030c001000023a801871382d40582c4500e00e1100001e2a4480a07038274030203500e00e1100001e011d007251d01e206e285500e00e1100001e8c0ad08a20e02d10103e9600e00e11000018000000000000000000000000000000000000000000000000000000004b";
                DP-1 = "00ffffffffffff0005e36a24f9770100131e0104a5351e783b6435a5544f9e27125054bfef00d1c081803168317c4568457c6168617c023a801871382d40582c4500132b2100001efc7e80887038124018203500132b2100001e000000fd002392a0a021010a202020202020000000fc003234363047340a20202020202001c602031ef14b0103051404131f12021190230907078301000065030c001000fe5b80a07038354030203500132b2100001e866f80a07038404030203500132b2100001e011d007251d01e206e285500132b2100001eab22a0a050841a3030203600132b2100001a7c2e90a0601a1e4030203600132b2100001a000000000000004e";
            };

            config = {
                HDMI-1 = {
                    enable = true;
                    primary = false;
                    crtc =  0;
                    gamma =  "1.0:0.909:0.833";
                    mode =  "1920x1080";
                    position =  "0x0";
                    rate =  "60.00";
                };

                DP-1 = {
                    enable = true;
                    primary = true;
                    crtc =  1;
                    gamma =  "1.0:0.909:0.833";
                    mode =  "1920x1080";
                    position =  "1920x0";
                    rate =  "144.00";
                };
            };
        };
    };
}