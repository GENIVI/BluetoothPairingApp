/*
 * Copyright (C) 2016, Pelagicore AB.
 *
 * Author: Zeeshan Ali <zeeshan.ali@pelagicore.com>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import com.pelagicore.bluetooth 1.0

ListView {
    id: deviceList
    clip: true

    model: blueConnect

    delegate: Rectangle {
        id: btDelegate
        width: parent.width
        height: bttext.height + 10

        property string selectedColor: "orange"
        property string color1: "#777777"
        property string color2: "#666666"

        color: model.selected ? selectedColor :
                                (index % 2 == 0 ? color1 : color2)


        property bool expended: false;

        clip: true
        Image {
            id: bticon
            source: "bluetooth.svg";
            width: 18;
            height: 33;
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 5
        }

        Text {
            anchors.left: bticon.right
            anchors.leftMargin: 5
            anchors.verticalCenter: bticon.verticalCenter
            id: bttext
            text: model.name
            font.family: "FreeSerif"
            font.pointSize: 20
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                blueConnect.connect (index);
            }
        }

        Button {
            visible: model.paired
            text: "Remove pairing"
            anchors.right: parent.right
            anchors.verticalCenter: bticon.verticalCenter

            style: ButtonStyle {
                  label: Text {
                    renderType: Text.NativeRendering
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "FreeSerif"
                    font.pointSize: 20
                    text: control.text
                  }
                }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    blueConnect.unpair (index);
                }
            }
        }

        Behavior on height { NumberAnimation { duration: 200} }
    }
    focus: true
}
