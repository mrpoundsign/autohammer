import { Event } from "../event";
import { AHQuickbar } from "../autohammer/quickbar";

declare global {
    interface IQuickbarComponent {
        size: number,
    }

    interface Entity {
        quickbar: QuickbarComponent;
        addQuickbar(data?: IQuickbarComponent): QuickbarComponent;
    }
}

const QUICKBAR_SIZE = 10;

class Quickbar {
    static SCHEMA: Schema = new Schema([
        new SchemaField("items", DataTypes.ARRAY, DataTypes.ENTITY),
    ]);

    items: Array<EntityID> = [];

    constructor() {
        for (let i = 0; i < QUICKBAR_SIZE; ++i) {
            this.items.push(INVALID_ENTITYID);
        }
    }
}

class QuickbarComponent implements IQuickbarComponent {
    static type: string = "quickbar";
    static cid: number = hash.hash_str32(QuickbarComponent.type);
    static serialization: number = SERIALIZATION_SCRIPT;
    static SCHEMA: Schema = new Schema([
        new SchemaField("quickbars", DataTypes.ARRAY, DataTypes.COMPLEX, () => { return new Quickbar(); }),
        new SchemaField("activeBar", DataTypes.UINT8),
    ]);

    size: number;
    quickbars: Array<Quickbar> = [];
    activeBar: number = 0;
    activeItem?: number;
    onActiveChange: Event<[active: Quickbar, previous: number, index: number]> = new Event();
    onActiveIndexChange: Event<[active: Quickbar, previous?: number, index?: number]> = new Event();
    onItemChange: Event<[active: Quickbar, index: number, EntityID: EntityID]> = new Event();

    constructor(quickbar: IQuickbarComponent) {
        this.size = quickbar.size;
        for (let i = 0; i < this.size; ++i) {
            this.quickbars.push(new Quickbar());
        }
    }

    get active() {
        return this.quickbars[this.activeBar];
    }

    setActiveBar(index: number) {
        if (index != this.activeBar) {
            this.setActiveItem();
            const previous = this.activeBar;
            this.activeBar = index;
            this.onActiveChange.invoke(this.active, previous, index);
        }
    }

    setActiveItem(index?: number) {
        if (index != this.activeItem) {
            const previous = this.activeItem;
            this.activeItem = index;
            this.onActiveIndexChange.invoke(this.active, previous, index);
        }
    }

    set(quickbarIndex: number, index: number, entityID: EntityID) {
        if (!AHQuickbar.QuickbarSet(quickbarIndex, index, entityID, this.quickbars[quickbarIndex].items[index])) {
            return;
        }
        this.quickbars[quickbarIndex].items[index] = entityID;
        this.onItemChange.invoke(this.quickbars[quickbarIndex], index, entityID);

        if (entityID != INVALID_ENTITYID) {
            for (let i = 0; i < this.quickbars[quickbarIndex].items.length; i++) {
                const item = this.quickbars[quickbarIndex].items[i];
                if (item == entityID && index != i) {
                    this.quickbars[quickbarIndex].items[i] = INVALID_ENTITYID;
                    this.onItemChange.invoke(this.quickbars[quickbarIndex], i, INVALID_ENTITYID);
                }
            }
        }
    }
}

export { QuickbarComponent, QuickbarComponent as component, Quickbar };