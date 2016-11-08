#ifndef TP6_REP_H
#define TP6_REP_H


class Rep {
    int *info;

public:

    Rep(int a) {
        info = new int[a];

        throw a;
    }

    ~Rep() {
        delete info;
    }
};


#endif //TP6_REP_H
