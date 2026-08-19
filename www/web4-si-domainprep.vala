/* web4-si-domainprep.vala - Web4.SI Domain Sanitizer & IDNA Resolver */

using ICU;

namespace Web4.SI {

    public class DomainResolver : GLib.Object {

        public static string to_ascii_domain (string input_domain) throws GLib.Error {
            ErrorCode status = ErrorCode.ZERO_ERROR;
            
            // Open UTS #46 IDNA engine for strict web4.si domain validation
            IDNA? idna = IDNA.open_uts46(0, out status);

            if (status.is_failure() || idna == null) {
                throw new GLib.IOError.FAILED("ICU UTS46 Engine Initialization Failed: %s".printf(status.to_string()));
            }

            uint8[] dest = new uint8[256];
            IDNAInfo info = IDNAInfo();

            int len = idna.name_to_ascii_utf8(
                input_domain.data,
                input_domain.length,
                dest,
                dest.length - 1,
                out info,
                out status
            );

            // Fail on ICU status error or non-zero UTS46 validation bitmask
            if (status.is_failure() || info.errors != 0) {
                throw new GLib.IOError.INVALID_DATA(
                    "IDNA validation failed for '%s': %s (Error Bitmask: 0x%X)".printf(
                        input_domain, status.to_string(), info.errors
                    )
                );
            }

            // Ensure null-termination before string casting
            dest[len] = 0;
            return (string) dest;
        }

        public static int main (string[] args) {
            // Target internationalized Web4.SI domain endpoint
            string target_handle = (args.length > 1) ? args[1] : "münchen.docs.web4.si";

            stdout.printf("========================================\n");
            stdout.printf("  Web4.SI Domain & Route Sanitizer      \n");
            stdout.printf("========================================\n");
            stdout.printf("Input Domain   : %s\n", target_handle);

            try {
                string ascii_domain = to_ascii_domain(target_handle);
                
                stdout.printf("Punycode/ASCII : %s\n", ascii_domain);
                stdout.printf("Web4 Route     : https://%s/\n", ascii_domain);
                stdout.printf("Status         : VALIDATED\n");
            } catch (GLib.Error e) {
                stderr.printf("Web4.SI Resolution Error: %s\n", e.message);
                return 1;
            }

            return 0;
        }
    }
}
