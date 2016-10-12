#ifndef TP4_IMMEUBLE_H
#define TP4_IMMEUBLE_H

class Immeuble {
private:
    int l;
    int h;
};

class Tour {
private:
    const static int H = 30;
    int rg; // Indique la position de la tour.

public:
    static int getH();
    inline void setRg(int i) {
        this->rg = i;
    }
};

class Barre {
private:
    const static int L = 100;
};

class TourBarre {

};

#endif //TP4_IMMEUBLE_H
