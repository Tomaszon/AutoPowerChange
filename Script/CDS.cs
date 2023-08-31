using System;
using System.Runtime.InteropServices;
using Microsoft.Win32;

namespace cds
{
	[StructLayout(LayoutKind.Explicit)]
	public struct DEVMODE
	{
		[FieldOffset(102)]
		public short dmLogPixels;

		[FieldOffset(104)]
		public int dmBitsPerPel;

		[FieldOffset(108)]
		public int dmPelsWidth;

		[FieldOffset(112)]
		public int dmPelsHeight;

		[FieldOffset(116)]
		public int dmDisplayFlags;

		[FieldOffset(120)]
		public int dmDisplayFrequency;
	}

	public class Helper
	{
		public static DEVMODE GetDisplaySettings(string displayId)
		{
			var devMode = new DEVMODE();

			var retCode = EnumDisplaySettings(null, -1, ref devMode);
			if (retCode == 0)
			{
				throw new Exception("Can't get resolution from win api");
			}

			return devMode;
		}

		public static string ChangeDisplaySettings(int width, int height, int dpi, string id, string index)
		{
			var devMode = GetDisplaySettings(id);

			if (devMode.dmPelsHeight == height && devMode.dmPelsWidth == width)
			{
				return "Settings did not change. Current and target resolutions are the same.";
			}

			var displayKey = GetDisplayRegistryKey(id, index);

			displayKey.SetValue("PrimSurfSize.cx", width);
			displayKey.SetValue("PrimSurfSize.cy", height);

			var dpiKey = GetDPIRegistryKey(id);

			dpiKey.SetValue("DpiValue", dpi);

			devMode.dmPelsWidth = width;
			devMode.dmPelsHeight = height;

			var res = ChangeDisplaySettings(ref devMode, 0x00);

			switch (res)
			{
				case 0:
					return "The settings change was successful.";
				case 1:
					return "The computer must be restarted for the graphics mode to work.";
				case -1:
					return "The display driver failed";
				case -2:
					return "The graphics mode is not supported.";
				case -3:
					return "Unable to write settings to the registry.";
				case -4:
					return "An invalid set of flags was passed in.";
				case -5:
					return "An invalid parameter was passed in. This can include an invalid flag or combination of flags.";
				case -6:
					return "The settings change was unsuccessful because the system is DualView capable.";
				default:
					return "unknow return code: " + res;
			}
		}

		private static RegistryKey GetDisplayRegistryKey(string displayId, string displayIndex)
		{
			var key = Registry.LocalMachine.OpenSubKey("SYSTEM", true);

			key = key.OpenSubKey("CurrentControlSet", true);
			key = key.OpenSubKey("Control", true);
			key = key.OpenSubKey("GraphicsDrivers", true);
			key = key.OpenSubKey("Configuration", true);
			key = key.OpenSubKey(displayId, true);

			return key.OpenSubKey(displayIndex, true);
		}

		private static RegistryKey GetDPIRegistryKey(string displayId)
		{
			RegistryKey key = Registry.CurrentUser.OpenSubKey("Control Panel", true);

			key = key.OpenSubKey("Desktop", true);
			key = key.OpenSubKey("PerMonitorSettings", true);

			return key.OpenSubKey(displayId, true);
		}

		[DllImport("user32.dll")]
		private static extern int EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode);

		[DllImport("user32.dll")]
		private static extern int ChangeDisplaySettings(ref DEVMODE devMode, int flags);
	}
}