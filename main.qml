/*
 * Copyright (C) 2017, Luxoft AB.
 *
 * Author: Viktor Sjölind <vsjolind@luxoft.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtQuick 2.0
import QtQuick.Controls 1.4
import com.pelagicore.bluetooth 1.0


Item {
    id: main
    width: 1840
    height: 1080
    visible: true

    BlueConnect {
        id: blueConnect
    }

    Rectangle {
        color: "#333"
        anchors.fill: parent
        anchors.bottom: parent.bottom
    }

    DeviceList {
        id: deviceList
        model: blueConnect

        anchors.fill: parent
    }

}

