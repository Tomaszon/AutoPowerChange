using System;
using System.Runtime.InteropServices;
using Microsoft.Win32;

namespace CMS
{
	public class Helper
	{
		[DllImport("user32.dll")]
		private static extern bool SwapMouseButton(bool swap);

		public static void SwapMouseButtons(bool toLeftHanded)
		{
			var key = GetSwapMouseRegistryKey();

			if (toLeftHanded)
			{
				SwapMouseButton(true);

				key.SetValue("SwapMouseButtons", "1");
			}
			else if (!toLeftHanded)
			{
				SwapMouseButton(false);

				key.SetValue("SwapMouseButtons", "0");
			}
		}

		private static RegistryKey GetSwapMouseRegistryKey()
		{
			RegistryKey key = Registry.CurrentUser.OpenSubKey("Control Panel", true);

			return key.OpenSubKey("Mouse", true);
		}
	}
}