library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula_tb is
end entity;

architecture behavior of ula_tb is
    signal OSC        : std_logic := '0';
    signal SUBCARRIER : std_logic;
    signal Y          : std_logic;
    signal U          : std_logic;
    signal V          : std_logic;
    signal A14        : std_logic := '1';
    signal A15        : std_logic := '1';
    signal MREQ       : std_logic := '1';
    signal WR         : std_logic := '1';
    signal RD         : std_logic := '1';
    signal CPU        : std_logic;
    signal CS         : std_logic := '1';
    signal ULA_D      : std_logic_vector(7 downto 0) := (others => 'Z');
    signal VRAM_A     : std_logic_vector(6 downto 0);
    signal VRAM_CAS   : std_logic;
    signal VRAM_RAS   : std_logic;
    signal VRAM_WR    : std_logic;
    signal VERT50_60  : std_logic := '0';
    signal INT        : std_logic;
    signal KEYBOARD   : std_logic;
    signal SOUND      : std_logic;
    signal MIC        : std_logic;
    signal HSYNC      : std_logic;
    signal VSYNC      : std_logic;
    signal BURSTGATE  : std_logic;
    signal T          : std_logic_vector(4 downto 0) := (others => '1');
begin

    uut: entity work.ula
        port map(
            OSC         => OSC,
            SUBCARRIER  => SUBCARRIER,
            CSYNC       => open,
            HSYNC       => HSYNC,
            VSYNC       => VSYNC,
            BURSTGATE   => BURSTGATE,
            Y           => Y,
            U           => U,
            V           => V,
            A14         => A14,
            A15         => A15,
            MREQ        => MREQ,
            WR          => WR,
            RD          => RD,
            CPU         => CPU,
            CS          => CS,
            ULA_D       => ULA_D,
            VRAM_A      => VRAM_A,
            VRAM_CAS    => VRAM_CAS,
            VRAM_RAS    => VRAM_RAS,
            VRAM_WR     => VRAM_WR,
            VERT50_60   => VERT50_60,
            INT         => INT,
            KEYBOARD    => KEYBOARD,
            SOUND       => SOUND,
            MIC         => MIC,
            T           => T
        );

    osc_proc: process
    begin
        while true loop
            OSC <= '0';
            wait for 35 ns;
            OSC <= '1';
            wait for 35 ns;
        end loop;
    end process;

    monitor: process
    begin
        wait until HSYNC = '0' and HSYNC'event;
        report "HSync asserted at " & time'image(now) severity note;
        wait until VSYNC = '0' and VSYNC'event;
        report "VSync asserted at " & time'image(now) severity note;
        wait;
    end process;

    stim_proc: process
    begin
        report "Starting simulation in PAL mode" severity note;
        wait for 20 ms;
        VERT50_60 <= '1';
        report "Switching to NTSC mode" severity note;
        wait for 13 ms;
        report "Simulation complete" severity note;
        wait;
    end process;

end architecture;
