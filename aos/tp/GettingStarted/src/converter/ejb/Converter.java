package converter.ejb;

import javax.ejb.Remote;
import java.math.BigDecimal;

@Remote
public interface Converter {
    public BigDecimal yenToEuro(BigDecimal yen);
    public BigDecimal dollarToYen(BigDecimal dollars);
}
