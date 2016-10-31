package converter.ejb;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.ejb.Stateless;


/**
 * This is the bean class for the ConverterBean enterprise bean.
 * @author ian
 */
@Stateless
public class ConverterBean implements Converter, Serializable{
    private BigDecimal euroRate = new BigDecimal("0.0100169");
    private BigDecimal yenRate = new BigDecimal("79.3916");

    public BigDecimal dollarToYen(BigDecimal dollars) {
        BigDecimal result = dollars.multiply(yenRate);

        return result.setScale(2, BigDecimal.ROUND_UP);
    }

    public BigDecimal yenToEuro(BigDecimal yen) {
        BigDecimal result = yen.multiply(euroRate);

        return result.setScale(2, BigDecimal.ROUND_UP);
    }
}
